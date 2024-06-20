# execute nix-shell in current-directory, and nix will create shell with configuration given in this file
let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
	# install packages in shell
  packages = with pkgs; [
    cowsay
    lolcat
  ];

	# declare env variables
	GREETING = "Hello, Nix!";

	# execute before entering nix-shell
	shellHook = ''
		echo $GREETING | cowsay | lolcat
	'';
}

