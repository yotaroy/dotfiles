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

## Machine-local gitignore

`~/.gitignore_global` is **generated**, not symlinked, because git accepts only
one global ignore file (`core.excludesFile`). `gitignore.sh` merges two sources
into it:

| source | tracked by git | purpose |
| --- | --- | --- |
| `<dotfiles>/.gitignore_global` | yes | rules shared across all machines |
| `~/.gitignore_global.local` | no | rules for the current machine only |

After editing either file, regenerate:

```bash
./gitignore.sh
```

`./deploy.sh` and `./install.sh` run it automatically. The generated file
repeats these instructions in its header.

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

