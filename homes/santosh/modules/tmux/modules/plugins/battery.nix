{
  pkgs,
  ...
}:
{
  plugin = pkgs.tmuxPlugins.battery;
  extraConfig = ''
    # Battery Icons Configuration
    set -g @batt_icon_charge_tier8 '󰁹'
    set -g @batt_icon_charge_tier7 '󰂀'
    set -g @batt_icon_charge_tier6 '󰁿'
    set -g @batt_icon_charge_tier5 '󰁾'
    set -g @batt_icon_charge_tier4 '󰁽'
    set -g @batt_icon_charge_tier3 '󰁼'
    set -g @batt_icon_charge_tier2 '󰁻'
    set -g @batt_icon_charge_tier1 '󰁺'
    set -g @batt_icon_status_charged '󰂅 '
    set -g @batt_icon_status_charging '󱐋'
    set -g @batt_icon_status_discharging '󰂀'
  '';
}
