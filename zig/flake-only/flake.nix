# flake.nix

{
  
  description = "A flake template for Zig projects.";

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
      
      devShells.${system}.default = pkgs.mkShell {
        
        nativeBuildInputs = with pkgs; [
          zig
        ];

        shellHook = ''
          echo "---Development Environment Activated---"
          echo
          echo "[Dependencies]"
          echo "└─(Zig)──────> $(zig version)"
          echo
        '';

        # VARIABLE = "VALUE";
        # FILE = import ./something-else.nix
      };

      apps.${system}.default = pkgs.stdenv.mkDerivation {
        
        name = appName;
        inherit system;
        
        src = ".";
        
        nativeBuildInputs = [pkgs.zig];
        
        buildPhase = ''
          zig build-exe main.zig
        '';
        
        installPhase = ''
          mkdir -p $out/bin
          cp target/release/${appName} $out/bin/${appName}
          chmod +x $out
        '';
      };
    };
}