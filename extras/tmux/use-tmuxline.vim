Plug 'edkolev/tmuxline.vim'
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {}
let g:tmuxline_preset.a = '#(whoami)@#h'
let g:tmuxline_preset.b = ['#S#F', '#W']
let g:tmuxline_preset.c = '#(osascript ~/macos-jump-start/extras/tmux/track.applescript)'
let g:tmuxline_preset.win = ['#I', '#W']
let g:tmuxline_preset.cwin = ['w #I', '#W']
let g:tmuxline_preset.x = ''
let g:tmuxline_preset.y = ['#(bash ~/macos-jump-start/extras/tmux/uptime.sh)', '#(uptime | cut -d , -f 3- | cut -d : -f 2 | xargs)']
let g:tmuxline_preset.z = ['%a', '%Y-%m-%d %R']
