# My keybindings

## dwm

The MODKEY is set to Super key (the Windows key)
Keybindings | Action
------------|-------
`MODKEY + p` | opens `dmenu` as launcher
`MODKEY + RETURN` | opens terminal `st`
`MODKEY + b` | hides and shows bar
`MODKEY + j` | focus stack +1 (switches focus between windows in the stack)
`MODKEY + k` | focus stack -1 (switches focus between windows in the stack)
`MODKEY + i` | moves top slave window in the stack to master
`MODKEY + d` | moves bottom master window in the stack to slave
`MODKEY + h` | setmfact -0.05 (expands size of window)
`MODKEY + l` | setmfact +0.05 (shrinks size of window)
`MODKEY + SHIFT + RETURN` | zoom (switches current window between master/slave and slave/master)
`MODKEY + TAB` | view (switches to last used tag and back)
`MODKEY + t` | setlayout 0 (changes to tilling mode)
`MODKEY + f` | setlayout 0 (changes to floating mode)
`MODKEY + m` | setlayout 0 (changes to monocle mode)
`MODKEY + SPACE` | setlayout between tilling and floating
`MODKEY + SHIFT + SPACE` | toggle floating (swithces window mode to floating and back)
`MODKEY + 0` | shows all windows in all tags in current tag
`MODKEY + SHIFT + 0` | Active all tags
`MODKEY + .` | focusmon +1 (switches focus next monitors)
`MODKEY + ,` | focusmon -1 (switches focus to prev monitors)
`MODKEY + SHIFT + .` | tagmon +1 (switches tag next monitors)
`MODKEY + SHIFT + ,` | tagmon -1 (switches tag to prev monitors)
`MODKEY + 1-9` | switch focus to tag (1-9)
`MODKEY + SHIFT + 1-9` | send focusd window to tag (1-9)
`MODKEY + q` | closes focused window
`MODKEY + SHIFT + r` | restarts dwm
`MODKEY + SHIFT + q` | quits dwm
`MODKEY + z` | poweroff
`MODKEY + x` | restart
`MODKEY + s` | restart
`MODKEY + SHIFT + l` | locks screen right now
`MODKEY + SHIFT + d` | disable auto lock
`MODKEY + SHIFT + e` | enable auto lock
`MODKEY + SHIFT + p` | multi-monitor setup
------ | ------
`CTRL + SHIFT + ALT + f` | opens firefox
`CTRL + SHIFT + ALT + c` | opens chromium
`CTRL + SHIFT + ALT + w` | opens weechat
`CTRL + SHIFT + ALT + m` | opens mutt
`CTRL + SHIFT + ALT + r` | opens ranger
`CTRL + SHIFT + ALT + a` | opens alsamixer (floating)

## st

The MODKEY is set to ALT key
Keybindings | Action
------------|-------
`MODKEY + o` | opens URL in Firefox
`MODKEY + y` | copies URL (xclip)
`MODKEY + k/UP` | scrolls line up line by line
`MODKEY + j/DOWN` | scrolls line down line by line
`MODKEY + u/Page_Up` | scrolls page up page by page
`MODKEY + d/Page_Down` | scrolls page down page by page
`CTRL + SHIFT + k/Up` | zoom +1
`CTRL + SHIFT + j/Down` | zoom -1
`CTRL + SHIFT + u` | zoom +2
`CTRL + SHIFT + d` | zoom -2
`CTRL + SHIFT + Home` | zoom reset
`CTRL + SHIFT + c` | copies selected content
`CTRL + SHIFT + v` | pastes from clipboard
`SHIFT + Insert` | pastes from clipboard

## zsh

Keybindings | Action
------------|-------
`CTRL + t` | searches file in current folder and sub folder
`CTRL + r` | searches command from history
`ALT + c` | searches folder and enter into selected folder
`CTRL + f` | accepts suggested command
`esc` | enters into `normal` mode, then use `j` and `k` to navigate command history
`i` | enters into edit mode (default mode)
