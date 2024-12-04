# Hacking environment (Nix)

> [!CAUTION]
> Make sure you have configured the `flake.nix` with your system type!
> Available systems are: `"x86_64-linux"`, `"aarch64-linux"`, `"x86_64-darwin"`, `"aarch64-darwin"`.
> Change this line in the `flake.nix` file for having all right:
>
> ```nix
> let system = "x86_64-linux"
> ```

This hacking environment has been built with Nix store, so you can easily work with the declarative configuration it offers. If you want to set up your own configuration, just use these repo and modify the `home.nix`  file.
