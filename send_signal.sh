# part 2/2 of an apple automator workflow where i send myself messages containing highlighted text using signal-cli. perfect for
# saving anything interesting that you read!
# i map the apple automator workflow to a key binding (can be done through keyboard shortcuts)
# signal is an open source e2e messaging app where i save interesting tidbits of info#!/bin/zsh

export PATH=$HOME/signal-cli/build/install/signal-cli/bin:/usr/local/bin/:$PATH

# Get the copied text from the clipboard
copied_text="$(pbpaste)"

# Convert HTML to plain text using html2text
plain_text="$(echo "$copied_text" | html2text -nobs -ascii)"

# Your Signal command
signal_command="signal-cli send --note-to-self -m '${plain_text}' yourphonenumber"
eval $signal_command
