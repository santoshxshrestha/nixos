#!/usr/bin/env bash
set -euo pipefail

# Stream a single float amplitude (0..1+) per line.
#
# This is intentionally lightweight and dependency-free: it reads raw float
# samples from PipeWire and computes a peak over a short window.
#
# Notes:
# - Requires: pipewire (pw-record), gawk.
# - If --target fails (node id/name mismatch), we fall back to auto.

RATE="${RATE:-48000}"
CHANNELS="${CHANNELS:-2}"
WINDOW_SAMPLES_PER_CH="${WINDOW_SAMPLES_PER_CH:-256}"  # ~5.3ms @ 48kHz
TARGET_SINK_ID="${TARGET_SINK_ID:-@DEFAULT_AUDIO_SINK@}"

# Record from the sink node via pw-cat, which in practice works reliably under PipeWire.
record_cmd=(pw-cat --record --rate "$RATE" --channels "$CHANNELS" --format f32 --raw --target "$TARGET_SINK_ID" -)

# If that fails (node id/name mismatch), fall back to auto.
if ! "${record_cmd[@]}" </dev/null >/dev/null 2>&1; then
  record_cmd=(pw-cat --record --rate "$RATE" --channels "$CHANNELS" --format f32 --raw -)
fi

"${record_cmd[@]}" 2>/dev/null |
  perl -e '
    use strict;
    use warnings;
    use bytes;

    my $channels = $ENV{"CHANNELS"} // 2;
    my $ws = $ENV{"WINDOW_SAMPLES_PER_CH"} // 256;
    my $win_floats = $channels * $ws;
    my $win_bytes = $win_floats * 4;

    STDOUT->autoflush(1);
    binmode STDIN;

    while (1) {
      my $buf = "";
      my $read = read(STDIN, $buf, $win_bytes);
      last if !defined($read) || $read == 0;
      next if length($buf) < $win_bytes;

      my $peak = 0.0;
      for (my $i = 0; $i < $win_floats; $i++) {
        my $f = unpack("f<", substr($buf, $i*4, 4));
        $f = -$f if $f < 0;
        $peak = $f if $f > $peak;
      }

      printf("%.4f\n", $peak);
    }
  '
