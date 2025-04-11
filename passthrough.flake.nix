# flake.nix

{
  
  description = "An empty template importing a nix shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: 
    let 
      appName = "example";
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = (import ./shell.nix { inherit pkgs; });
      
      apps.${system}.default = pkgs.stdenv.mkDerivation {
        
        name = appName;
        inherit system;

        src = ".";

        nativeBuildInputs = with pkgs; [
          # Add any build dependencies here.
        ];
        
        # TODO: Add build steps here.
        buildPhase = ''
          # ...
        '';

        installPhase = ''
          mkdir -p $out/bin
          cp target/release/${appName} $out/bin/${appName}
          chmod +x $out
        '';
      };
    };
}