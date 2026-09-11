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

## Install packages via Homebrew

```bash
brew bundle --file=./Brewfile
```

`install.sh` runs this automatically when `brew` is available.

## Demo

```bash
docker build -t dotfiles-test .
docker container run -it --rm -v $(pwd):/home/test-user/dotfiles dotfiles-test:latest
```

