-- NewFileFromFinder by psobko-- Based off liciniosoares.com/content/new-file-mac-os-xtry	tell application "Finder" to set the this_folder to (folder of the front window) as aliason error -- no open folder windows	set the this_folder to path to desktop folder as aliasend trytry	tell application "Finder" to set the source_folder to (folder "Documents:Templates") of home	set all_files to name of every file of source_folder	if item 1 of all_files is ".DS_Store" then		set file_list to rest of all_files	else		set file_list to all_files	end if	set selectFile to (choose from list file_list with prompt "Pick the file you want to create.")	set from_folder to source_folder as alias	set myfile to from_folder & selectFile as texton error -- template folder has not been create	display dialog "Template Folder does not exit. Creating a folder at Documents/Templates."	tell application "Finder"		tell application "Finder" to set the source_folder to (folder "Documents") of home		make new folder at source_folder with properties {name:"Templates"}		set doc_folder to POSIX path of (path to documents folder as string)		do shell script "touch " & doc_folder & "Templates/txt" & ".txt"	end tell	quit meend trytry	tell application "Finder"		duplicate myfile to this_folder	end tellon error errMsg number errNum -- warn user that a file with the same name already exists	if errNum = -15267 then		display dialog errMsg	else		quit me	end ifend try