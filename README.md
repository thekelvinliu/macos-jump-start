# macos-jump-start
scripts and dotfiles for a happy development environment

## about
this is a collection of **bash** scripts and other configs
that i find useful for my terminal- and vim-heavy workflow.
it bootstraps and configures the latest versions of bash, homebrew, git, neovim,
and [more](https://github.com/thekelvinliu/macos-jump-start/tree/master/scripts).
`extras` is where i put stuff more specific to my needs.
there be dragons, etc.
inspiried by [nicolashery/mac-dev-setup](https://github.com/nicolashery/mac-dev-setup),
my first intro into dotfiles.

## installation
before use, update to macos **10.14.3**,
and install either xcode.app from the [app store](https://itunes.apple.com/us/app/xcode/id497799835)
or xcode command line tools by running `xcode-select --install` in a terminal.
open or run xcode at least once and agree to the license too.
finally, clone this repo in your home directory, execute `setup.sh`, and restart your shell:

```bash
$ cd "$HOME"
$ git clone https://github.com/thekelvinliu/macos-jump-start.git
$ ./macos-jump-start/setup.sh
```

if you don't want to keep this in your home directory:

```bash
$ export MJS_BASE=/some/custom/path
$ git clone https://github.com/thekelvinliu/macos-jump-start.git "$MJS_BASE"
$ "$MJS_BASE/setup.sh"
```

## notes
- customize by looking inside `scripts` and un/comment as you see fit
- execute any script as many times as you need
- `setup.sh` simply executes the files in `scripts` in order
- not posix compatible -- bashisms beware!
