on run {input, parameters}
    tell application "System Events"
        tell appearance preferences
            set currentMode to dark mode
            if currentMode is true then
                set dark mode to false
            else
                set dark mode to true
            end if
        end tell
    end tell
    return input
end run

