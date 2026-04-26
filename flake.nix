{
  description = "Dev shell for running Doom Emacs sync reproducibly on NixOS";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          emacs
          git
          ripgrep
          fd
          gcc
          gnumake
          cmake
          pkg-config
          sqlite
          python3
          typst
          tinymist
          typstyle
        ];
      };
    };
}
