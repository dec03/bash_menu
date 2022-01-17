#!/bin/bash




#this is the main function that allows the user to navigate to the different parts of the code
main(){
#the choice variable contains the menubox and will assign the input that the user provides to choice
choice=$(dialog --backtitle "MAIN MENU" \
#attributes of box
--title "WELCOME TO THE MAIN MENU" \
--menu "Select an Option" 0 0 0 \
#list of options
1 "Date/time" \
2 "Calendar" \
3 "Delete" \
4 "System configuration" \
5 "Exit" --stdout)
 
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
	5) dialog --infobox "Shutting down..." 0 0 ; sleep 2;;			
esac
}






#date_time function
date_time () {
	#this assigns the date to the date_and_time variable
	date_and_time=$(date)
	#this prints the date and time as an infobox, so it will only pop up for 2 seconds
	dialog --infobox "$date_and_time" 0 0 ; sleep 2;
	#this goes back to the main function
	main
}





#system config menu
system_config_menu () {
	#this assigns the users choice from the menu box to the variable choice
	choice=$(dialog --backtitle "SYSTEM MENU" \
	#attributes of box
	--title "WELCOME TO THE SYSTEM CONFIGURATION MENU" \
	--menu "Select an option" 0 0 0 \
	#list of options
	1 "Operating System Type" \
	2 "CPU" \
	3 "Memory" \
	4 "Hard Disk" \
	5 "File System" \
	6 "Main menu" --stdout)
	
	#switch cases
	case $choice in
	6) main
	esac
}



#show_calendar function
show_calendar () {
	#outputs a calendar box that can be interacted with
	dialog --title "Calendar" --calendar "Use TAB to switch to different areas of the box" 0 0
	main	
}




main
