{
  description = "wioenena flake templates";

  outputs = { self, nixpkgs }: {
    templates.example = {
      path = ./example;
      description = "Example template";
    };
  };
}
