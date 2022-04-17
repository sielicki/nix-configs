{ config, pkgs, ... }:

{
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  system.stateVersion = "21.11"; # Did you read the comment?
  
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;


  sound.enable = false;
  hardware.pulseaudio.enable = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sielicki = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    tmux
    wget
  ];

  networking.firewall.enable = false;

}
