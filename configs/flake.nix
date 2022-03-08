{
  description = "My configs";

  outputs = { self }: {
    nixosModules = {
      messy_all = import ./messy_all;
      my_locale = import ./my_locale;
      desktop_apps = import ./desktop_apps;
    };
  };
}

