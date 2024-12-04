# Hacking environment (Nix)

![image](https://github.com/user-attachments/assets/c8f33e88-2e57-4cb9-828b-41af0739fa44)

> [!CAUTION]
> Make sure you have configured the `flake.nix` with your system type!
> Available systems are: `"x86_64-linux"`, `"aarch64-linux"`, `"x86_64-darwin"`, `"aarch64-darwin"`.
> Change this line in the `flake.nix` file for having all right:
>
> ```nix
> let system = "x86_64-linux"
> ```

This hacking environment has been built with Nix store, so you can easily work with the declarative configuration it offers. If you want to set up your own configuration, just use these repo and modify the `home.nix`  file.

## Running the environment
The main purpose of the `flake.nix` is to run with Docker. You can just run the following command
```bash
chmod +x ./run.sh && ./run.sh
```
Or just the commands inside the script
```bash
docker compose up -d --build && docker attach hacknix
```
If you want to dettach from container, just make the combination `Ctrl+P` & `Ctrl+Q` and for attaching, the previous `docker attach hacknix` command.

## Modifying the environment
You can just modify the `home.nix` file if you know a bit about Nix and Nix Declarative Language. You can search for packages in https://search.nixos.org/packages
