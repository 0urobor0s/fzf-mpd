# Introduction

`fzf-mpd` is a zsh plugin that allows you to control [mpd](https://www.musicpd.org/) using [fzf](https://github.com/junegunn/fzf) an awesome command-line fuzzy finder.

## Demo

<!-- [![asciicast](https://asciinema.org/a/FpQd0sZuOXTOB5c2fdanFvsVL.png)](https://asciinema.org/a/FpQd0sZuOXTOB5c2fdanFvsVL) -->
![](./demo.gif)

## Requirements

- [zsh](http://www.zsh.org/)
- [mpc](https://musicpd.org/clients/mpc/)
- [id3lib](http://id3lib.sourceforge.net/)

## Installation

If you use [Antigen](https://github.com/zsh-users/antigen), add the following line to your .zshrc:

```
antigen bundle piotryordanov/fzf-mpd
antigen apply
```

Otherwise, copy the [fzf-mpd script](https://raw.githubusercontent.com/0urobor0s/fzf-mpd/master/fzf-mpd.zsh) into your zsh.after director


## Usage

`fm`

You can also pass custom `mpc` commands directly with the `fm` command:

`fm -q -h 192.156.2.3 -p 55500`

## Global Launch (Mac only)

On Mac, you can launch `fm` from anywhere by running a keybinding. You'll need [Keyboard maestro](http://www.keyboardmaestro.com/main/)  or a similar software to do something like this: 

![](KeyboardMaestro.png)




