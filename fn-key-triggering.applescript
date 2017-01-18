tell application "System Preferences"
	set current pane to pane "com.apple.preference.keyboard"
end tell

tell application "System Events"
	if UI elements enabled then
		tell tab group 1 of window "Keyboard" of process "System Preferences"
			set fnCheckbox to checkbox "Use F1, F2, etc. keys as standard function keys"
			click fnCheckbox
			tell fnCheckbox
				if not (its value as boolean) then
					display notification "Fn key unticked" with title "Fn Key Triggering"
				else
					display notification "Fn key ticked" with title "Fn Key Triggering"
				end if
			end tell
		end tell
	else
		tell application "System Preferences"
			set current pane Â
				to pane "com.apple.preference.universalaccess"
			display dialog Â
				"UI element scripting is not enabled. Check \"Enable access for assistive devices\""
		end tell
	end if
end tell

tell application "System Preferences"
	quit
end tell