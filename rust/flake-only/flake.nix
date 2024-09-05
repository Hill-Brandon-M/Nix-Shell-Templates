# flake.nix

{
  
  description = "A flake template for Rust projects.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: 
    let 
      
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      overrides = (builtins.fromTOML (builtins.readFile ./rust-toolchain.toml));
      libPath = with pkgs; lib.makeLibraryPath [
        # TODO: load external libraries that you need in your rust project here
      ];
    
    in
    {
      
      devShells.${system}.default = pkgs.mkShell rec {
      
        buildInputs = with pkgs; [
          clang
          # TODO: Replace llvmPackages with llvmPackages_X, where X is the latest LLVM version (at the time of writing, 16)
          llvmPackages.bintools
          rustup
        ];
        
        RUSTC_VERSION = overrides.toolchain.channel;
        
        # https://github.com/rust-lang/rust-bindgen#environment-variables
        LIBCLANG_PATH = pkgs.lib.makeLibraryPath [ pkgs.llvmPackages_latest.libclang.lib ];
        shellHook = ''
          export PATH=$PATH:''${CARGO_HOME:-~/.cargo}/bin
          export PATH=$PATH:''${RUSTUP_HOME:-~/.rustup}/toolchains/$RUSTC_VERSION-x86_64-unknown-linux-gnu/bin/
          
          echo "---Development Environment Activated---"
          echo
          echo "[Dependencies]"
          echo "├─(Rustup)──> $(rustup --version)"
          echo "├─(Clang)───> $(clang --version)"
          echo "└─(LLVM)────> $(size --version)"
          echo
          '';
        
        # Add precompiled library to rustc search path
        RUSTFLAGS = (builtins.map (a: ''-L ${a}/lib'') [
          # TODO: add libraries here (e.g. pkgs.libvmi)
        ]);
        
        LD_LIBRARY_PATH = libPath;
        
        # Add glibc, clang, glib, and other headers to bindgen search path
        BINDGEN_EXTRA_CLANG_ARGS =
        # Includes normal include path
        (builtins.map (a: ''-I"${a}/include"'') [
          # TODO: add dev libraries here (e.g. pkgs.libvmi.dev)
          pkgs.glibc.dev
        ])
        # Includes with special directory paths
        ++ [
          ''-I"${pkgs.llvmPackages_latest.libclang.lib}/lib/clang/${pkgs.llvmPackages_latest.libclang.version}/include"''
          ''-I"${pkgs.glib.dev}/include/glib-2.0"''
          ''-I${pkgs.glib.out}/lib/glib-2.0/include/''
        ];
      }
    };
}