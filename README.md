# dotfiles
My personal dotfiles managed with [chezmoi](https://github.com/twpayne/chezmoi)
## Setup
- On a new machine, initialize `chezmoi` with this repo:
    ```sh
    chezmoi init git@github.com:nazavrr/dotfiles.git
    ```
- On the already configured machine:
    - Pull the latest changes with:
        ```sh
        chzpull
        ```
        `chzpull` is an alias for `chezmoi git pull -- --autostash --rebase`
    - Pull and apply the latest changes with:
        ```sh
        chezmoi update -v
        ```
## Usage
To check what files would change if you ran `chezmoi apply`:
```sh
chezmoi status
```
To see the changes `chezmoi apply` would make:
```sh
chezmoi diff
```
To apply the changes and see the diff:
```sh
chezmoi apply -v
```
