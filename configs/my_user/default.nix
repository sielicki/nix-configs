{ config, pkgs, ... }:

{
       users.users.sielicki.isSystemUser = false;
       users.users.sielicki.isNormalUser = true;
       users.users.sielicki.group = "sielicki";
       users.groups.sielicki = {};
}
