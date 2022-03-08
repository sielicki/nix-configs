{
  description = "My Machines";

  outputs = { self }: {
    nixosModules = {
      dogbox = import ./dogbox;
    };
  };
}

