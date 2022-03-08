
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    alacritty
    discord
  ];
  programs.steam.enable = true;
}
