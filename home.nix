{ pkgs, inputs, system, ... }:
with pkgs;
let 
  my-python-packages = python-packages: with python-packages; [
    joblib
    numpy
    pandas
    ptpython
    requests
    typer
    youtube-dl
    fastapi
    black
  ];
  python-with-my-packages = python310.withPackages my-python-packages;
in
{
  imports = [
    inputs.nix-doom-emacs.hmModule
  ];
  home.packages = with pkgs; [
    aria2
    bat
    emacsNativeComp
    fzf
    git
    htop
    lsof
    python-with-my-packages
    ripgrep
    tmux
    unzip
    usbutils
    vim
  ];

  services.emacs.enable = true;


}
