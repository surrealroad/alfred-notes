property bundleid : "com.surrealroad.alfred-note"
property cacheFile : "cache.plist"

on run
	set myPath to path to me
	tell application "Finder" to set workflowFolder to (folder of myPath) as string
	set lib to load script file (workflowFolder & "alfred_library.scpt")
	set wf to load script file (workflowFolder & "q_workflow.scpt")
	
	set wf to wf's new_workflow_with_bundle(bundleid)
	set cachePath to wf's _data & cacheFile
	
	--create plist if it doesn't already exist
	if not wf's q_file_exists(cachePath) then
		-- OS 10.10 workaround
		do shell script "defaults write " & quoted form of cachePath & " cacheInProgress 0"
	end if
	
	
	wf's set_value("cacheInProgress", (lib's unixtime(current date)), cacheFile)
	
	tell application id "com.apple.notes"
		set existingNotes to {}
		set noteList to every note
		
		repeat with note_item in noteList
			set noteRecord to {uid:note_item's id}
			set noteRecord to noteRecord & {title:note_item's name}
			if note_item's body is not missing value then set noteRecord to noteRecord & {notebody:note_item's body}
			set noteRecord to noteRecord & {creationdate:note_item's creation date}
			set noteRecord to noteRecord & {parentfolder:(note_item's container's name)}
			
			set end of existingNotes to noteRecord
		end repeat
		set closeNotes to wf's get_value("closeNotes", cacheFile)
		if closeNotes is not missing value and closeNotes then quit
		
	end tell
	wf's set_value("timestamp", (current date), cacheFile)
	wf's set_value("existingReminders", existingNotes, cacheFile)
	wf's set_value("cacheInProgress", 0, cacheFile)
	
	return
end run