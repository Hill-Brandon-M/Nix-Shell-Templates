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
      
      devShells.${system}.default = pkgs.mkShell {
        
        nativeBuildInputs = with pkgs; [
          libgcc
          gnumake
        ];

        shellHook = ''
          echo "---Development Environment Activated---"
          echo
          echo "[Dependencies]"
          echo "├─(GCC)───> $(gcc --version)"
          echo "└─(Make)──> $(make --version)"
          echo
        '';

        # VARIABLE = "VALUE";
        # FILE = import ./something-else.nix
      };

      apps.${system}.default = pkgs.stdenv.mkDerivation {
        
        name = appName;
        inherit system;

        src = ".";

        nativeBuildInputs = with pkgs; [
          # Add any build dependencies here.
          libgcc
          gnumake
        ];
        
        # TODO: Add build steps here.
        buildPhase = ''
          make
        '';

        installPhase = ''
          mkdir -p $out/bin
          cp target/release/${appName} $out/bin/${appName}
          chmod +x $out
        '';
      };
    };
}