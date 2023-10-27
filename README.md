   ___        _   _                  
  / _ \__  __| |_| |     ___  _ __   
 / /_)/\ \/ /| __|  --- / _ \| '_ \   
/ ___/  \  / | |_| | | | (_) | | | | 
\/      /_/   \__|_| |_|\___/|_| |_| 


# vim-python

vim-python is a Vim plugin for Python programming.

## Features

- Syntax highlighting
- Section movement
- Run python progam with hotkey or by command

## Install

Just use your Vim plugin manager to install the plugin, or clone this repository into plugin directory, such as `~/.vim/pack/bundle/start/`.

## Options

Set the following variables in your vimrc file.

| Variable | Type | Required | Description |
|:---------|:----:|:--------:|:------------|
| g:show_result_on_buffer | boolean | optional | 0: disable showing execution result in a new window, 1: enable (default) |

## How to use

> See more details by `:h vim-python`.

### Run Python

Use either the hotkey `<leader>r` or type `:RunPython` in Command Mode.

### Section Movement

Use `[[`, `]]`, `][`, `[]` for jumping to previous/next section by customizing the original behavior of them.


## License

Copyright (c) KarateJB. Distributed under the same terms as Vim itself. See `:help license`.
