tell application "System Events"
    tell appearance preferences
        get properties
        set currentValue to dark mode
    end tell
end tell

return currentValue
