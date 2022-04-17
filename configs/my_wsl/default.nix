{ lib, config, pkgs, modulesPath, ... }:

{
  wsl = {
    enable = true;
    automountPath = "/mnt";
    defaultUser = "sielicki";
    startMenuLaunchers = true;
    interop.register = true;

    # Enable integration with Docker Desktop (needs to be installed)
    # docker.enable = true;
  };
}
