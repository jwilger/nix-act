{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    core-flake = {
      url = "git+ssh://git@github.com/purplenoodlesoop/core-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , core-flake
    }:
    let
      core = core-flake.lib;
      name = "nix-act";
      systemSpecific = { pkgs, toolchains }: with pkgs; {
        devEnv = [ git ];
        packages.nix-act = callPackage ./nix-act.nix { };
      };
    in
    core.mkFlake {
      inherit name systemSpecific;
    };
}
