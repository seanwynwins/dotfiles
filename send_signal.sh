#!/bin/zsh

export PATH=$HOME/signal-cli/build/install/signal-cli/bin:$PATH

# Get the copied text from the clipboard
copied_text="$(pbpaste)"
# Your Signal command
signal_command="signal-cli send --note-to-self -m '${copied_text}' +<phonenumber>"
eval $signal_command
