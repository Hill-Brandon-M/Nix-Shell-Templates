# flake.nix

{
  
  description = "A flake template for Elixir projects.";

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
          elixir
        ];

        shellHook = ''
          echo "---Development Environment Activated---"
          echo
          echo "[Dependencies]"
          echo "└─(Elixir)───────> $(elixir --version)"
          echo
        '';

        # VARIABLE = "VALUE";
        # FILE = import ./something-else.nix

        apps.${system}.default = pkgs.stdenv.mkDerivation {
        
          name = appName;
          inherit system;

          src = ".";

          nativeBuildInputs = with pkgs; [
            # Add any build dependencies here.
            elixir
          ];
          
          # TODO: Add build steps here.
          buildPhase = ''
            elixirc main.ex
          '';

          installPhase = ''
            mkdir -p $out/bin
            cp target/release/${appName} $out/bin/${appName}
            chmod +x $out
          '';
        };
      };
    };
}