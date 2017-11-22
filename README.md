# macos-jump-start
scripts and dotfiles for a happy development environment

## about
this repository holds a collection of useful scripts and configurations to make bootstrapping a new development machine easier and faster.
it is heavily adapted from and influenced by [nicolashery/mac-dev-setup](https://github.com/nicolashery/mac-dev-setup).

## installation
before using this, try to have the latest and most up-to-date macos and xcode versions installed.
either install the full xcode from the [app store](https://itunes.apple.com/ae/app/xcode/id497799835?mt=12#),
or just the xcode command line tools by running `xcode-select --install` in a terminal.
open or run xcode at least once and agree to the license, too.
finally, clone this repo and `setup.sh`:

```bash
$ cd
$ git clone https://github.com/thekelvinliu/macos-jump-start.git
$ ./macos-jump-start/setup.sh
```

## notes
- tested on fresh installations of el capitan and (high) sierra
- the scripts in this repo should be sourced; `setup.sh` is the only executable script
- you should be able to source any script as many times as you want
- a lot of packages are not installed by default, so feel free to go through the `scripts` directory and un/comment as you see fit!
- the launchd stuff is pretty specific to my use case, so when prompted, you'll probably want to answer no
