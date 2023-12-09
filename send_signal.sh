# part 2/2 of an apple automator workflow where i send myself messages containing highlighted text using signal-cli. perfect for 
# saving anything interesting that you read!
# i map the apple automator workflow to a key binding (can be done through keyboard shortcuts)
# signal is an open source e2e messaging app where i save interesting tidbits of info
#!/bin/zsh

export PATH=$HOME/signal-cli/build/install/signal-cli/bin:$PATH

# Get the copied text from the clipboard
copied_text="$(pbpaste)"
# Your Signal command
signal_command="signal-cli send --note-to-self -m '${copied_text}' +<phonenumber>"
eval $signal_command
