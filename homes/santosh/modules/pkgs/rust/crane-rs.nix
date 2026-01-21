{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "crane-rs";
  version = "0.1.5";

  src = fetchFromGitHub {
    owner = "santoshxshrestha";
    repo = "crane-rs";
    tag = "v${finalAttrs.version}";
    hash = "sha256-5/uQyZ7CHP6aasMWGJekH/2nt4qJPUjekrf4bIC2AxE=";
  };

  cargoHash = "sha256-nTdcmx2Vp0wf9ov6k4WsIBuEMERNW4K5U7tuktddN4Y=";

  doInstallCheck = true;

  meta = {
    description = "self-hosted file sharing server in Rust.";
    homepage = "https://github.com/santoshxshrestha/crane-rs";
    changelog = "https://github.com/santoshxshrestha/crane-rs/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.mit;
    mainProgram = "crane-rs";
    maintainers = with lib.maintainers; [ santoshxshrestha ];
  };
})
