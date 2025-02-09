{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
          pkgs.neovim
          pkgs.alacritty
          pkgs.aerospace
          pkgs.zoxide
          pkgs.oh-my-zsh
          pkgs.nerd-fonts.meslo-lg
          pkgs.git
          pkgs.curl
          pkgs.openssl
          pkgs.bash
          pkgs.eza
          pkgs.fzf
          pkgs.stow
          pkgs.coreutils
          pkgs.gnupg
          pkgs.rustup
          pkgs.python39
        ];

      # Home Manager
      # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      # homebrew = {
      #   enable = true;
      #   casks = [];
      #   # brews =[];
      #   # masApps = [];
      #   onActivation.cleanup = "zap";
      # };
      
      # Font packages
      fonts.packages = [];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
      nixpkgs.config.allowUnfree = true;
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Heshams-MacBook-Pro-2
    darwinConfigurations."Heshams-MacBook-Pro-2" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
      ];
    };
  };
}
