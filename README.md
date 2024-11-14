# dotfiles

## Install dotfiles

```bash
./install.sh
source ${HOME}/.zshrc
# compile zinit after installing and reloading the shell
zinit self-update
```

## Deploy dotfiles

Creates symbolic links to the home directory.

```bash
./deploy.sh
```

Write your name and email to ~/.gitconfig.local`.

```bash
echo "[user]\n  name = XXXX XXXX\n  email = XXXX@XXXX" >> ~/.gitconfig.local
```

## Install via homebrew

- chrome
- alacritty
- 1password
- tmux
- alfred
- hackgen, hackgen-nerd
  - https://github.com/yuru7/HackGen
- karabiner

## Demo

```bash
docker build -t dotfiles-test .
docker container run -it --rm -v $(pwd):/home/test-user/dotfiles dotfiles-test:latest
```

