{ config, pkgs, ... }:

{
       users.users.sielicki.isSystemUser = true;
       users.users.sielicki.isNormalUser = false;
       users.users.sielicki.group = "sielicki";
       users.groups.sielicki = {};
}
