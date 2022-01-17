#!/bin/bash




#this is the main function that allows the user to navigate to the different parts of the code
main(){

	#the choice variable contains the menubox and will assign the input that the user provides to choice
	choice=$(dialog --backtitle "MAIN MENU" \
	--title "WELCOME TO THE MAIN MENU" \
	--menu "Select an Option" 0 0 0 \
	1 "Date/time" \
	2 "Calendar" \
	3 "Delete" \
	4 "System configuration" \
	5 "Exit" --stdout)
	#above is the attributes of the box with the list of options


	#switch case to allow the user to navigate to the different options
	case $choice in 
		#calls the date_time
		1) date_time;;
		
		#calls the show_calendar function
		2) show_calendar;;
			
			
		#calls function to delete a file	
		3) delete_file;;
			
		#this calls the system configuration menu	
		4) system_config_menu;;
				
		#this outputs a info box saying shutting down, and will kill the program in two seconds	
		5) dialog --infobox "Shutting down..." 0 0 ; sleep 1;;			
	esac #closes cases
}


#date_time function
date_time() {
	#this assigns the date to the date_and_time variable
	date_and_time=$(date)
	#this prints the date and time as an infobox, so it will only pop up for 2 seconds
	dialog --infobox "$date_and_time" 5 35 ; sleep 2;
	#this goes back to the main function
	main
}



#show_calendar function
show_calendar() {
	#outputs a calendar that can be interacted with in a dialog box
	dialog --title "Calendar" --calendar "Use TAB to switch to different areas of the box" 0 0
	main	
}


#delete file function
delete_file() {
	
	#assigns the path that the user inputs to this variable
	path=$(dialog --title "Remove File" --inputbox "What is the path?" 10 50 --stdout)
	#goes to the path that the user has chosen
	cd $path
	#this assigns the users input to this variable
	f=$(dialog --title "Remove File" --inputbox "What file do you want to delete" 10 50 --stdout)
	
	if [ -f $f ] 	#if the file is a file
	then
		rm $f #removes file
		dialog --title "Remove File" --infobox "$path \ $f: $f file deleted." 10 50 ; sleep 2 ;
		#outputs the path of the file and that its been removed
	else
		dialog --title "Remove File" --infobox "$f is not a file." 10 50 ; sleep 2 ;
		#outputs that the user input isnt a file
	fi 
	main
}



#system config menu
system_config_menu() {
	#this assigns the users choice from the menu box to the variable choice
	choice=$(dialog --backtitle "SYSTEM MENU" \
	--title "WELCOME TO THE SYSTEM CONFIGURATION MENU" \
	--menu "Select an option" 0 0 0 \
	1 "Operating System Type" \
	2 "CPU" \
	3 "Memory" \
	4 "Hard Disk" \
	5 "File System" \
	6 "Main menu" --stdout)
	#above is the attributes of the box with the list of options
	
	#switch cases
	case $choice in
	6) main
	esac
}


main
