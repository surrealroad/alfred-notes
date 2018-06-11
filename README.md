alfred-notes
============

To use, just type "n note_text" into Alfred. E.g. "n something very important I will probably forget"
To create a note from the clipboard, type "nclip optional_note_name"
 
Changelog:

- Tuesday, 17 September 2013 – Updated q_workflow module to latest version
- Thursday, 18 April 2013 – Only first line is used as a title when using "nclip" with no arguments
- Sunday, 7 April 2013 – Properly escape illegal characters in query
- Friday, 5 April 2013 – Fixed an issue where a temporary file was getting written to the wrong place, sorry about that!
- Thursday, 4 April 2013 – Combined into single workflow; renamed to "Notes"; fixed an issue with clip keyword; nclip now pastes - HTML if possible; workflow will notify if updates are available
- Saturday, 16 March 2013 – First version

Uses AppleScript implementation of the Workflow object class for Alfred 2 (https://github.com/qlassiqa/qWorkflow)
