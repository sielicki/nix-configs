{ config, pkgs, ... }:

{
  
  time.timeZone = "US/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
  services.xserver.layout = "us";
  #services.xserver.xkbOptions = "eurosign:e";

}
