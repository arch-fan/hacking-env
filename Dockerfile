FROM nixos/nix:latest

# Enable flakes
RUN echo "experimental-features = nix-command flakes" > /etc/nix/nix.conf

WORKDIR /root

# Removing man-db and bash-interactive because they have conlicts with home-manager
RUN nix-channel --update && \
  nix-env -e man-db bash-interactive git && \
  nix-env -iA nixpkgs.home-manager

COPY flake.nix .

# Running this for caching the inputs of the flake
RUN nix flake update

COPY home.nix .

RUN home-manager switch --flake .

# --login is required to load the env variables
CMD [ "bash", "--login" ]
