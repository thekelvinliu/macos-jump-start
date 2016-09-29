# osx-jump-start
scripts and dotfiles for a happy development environment

## About
A collection of useful scripts and configurations to make setting up a development easier and faster.

## Installation
Before using this, be sure to be up-to-date on macOS and have Xcode installed.
You can either have the full installed Xcode from the [App Store](https://itunes.apple.com/ae/app/xcode/id497799835?mt=12#),
or just the Xcode Command Line Tools by running `xcode-select --install` in a terminal.
Open or run Xcode at least once and agree to the liscence, too.
Then, clone this git repository and run `setup.sh` by executing the following lines in a terminal:

```bash
$ cd
$ git clone https://github.com/thekelvinliu/osx-jump-start.git
$ ./osx-jump-start/setup.sh
```

## Notes
- This has been tested on fresh installs of OS X 10.11 El Capitan and macOS 10.12 Sierra.
- You should be able to run the setup as many times as you want :)
- In the installation scripts, some packages and libraries are commented out.
  This is because I think they're definitely nice to have, but not essential.
  I usually end up installing them later, so the initial installation takes as little time as possible.
  Feel free to go through the `scripts` directory and un/comment as you see fit!
