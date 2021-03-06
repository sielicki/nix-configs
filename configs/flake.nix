{
  description = "My configs";

  outputs = { self }: {
    nixosModules = {
      messy_all = import ./messy_all;
      my_locale = import ./my_locale;
      desktop_apps = import ./desktop_apps;
      my_user = import ./my_user;
      my_wsl = import ./my_wsl;
    };
  };
}

