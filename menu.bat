#!/bin/bash
#this is the main function that allows the user to navigate to the different parts of the code
main () {
	echo
	echo "========================"
	echo "WELCOME TO THE MAIN MENU"
	echo "========================"
	echo
	echo "Option 1: Date/time"
	echo "Option 2: Calendar"
	echo "Option 3: Delete"
	echo "Option 4: System configuration"
	echo "Option 5: Exit"	
	#this take the input from the user and assigns it to the variable choice
	read choice
	#If statement will go to the date_time function if user input is 1
	if [ $choice == 1 ]; then
		#calls the date_time function
		date_time
	elif [ $choice == 2 ]; then
		#calls the show_calendar function
		show_calendar
	elif [ $choice == 3 ]; then
		#calls function to delete a file
		delete_path
	elif [ $choice == 4 ]; then
		#this calls the system configuration menu
		system_config_menu
	#this kills the program
	elif [ $choice == 5 ]; then
		exit
	else
		echo "Invalid Input"
		echo
		main
	fi
}


#date_time function
date_time () {
	#this assigns the date to the date_and_time variable
	date_and_time=$(date)
	#this prints the date and time
	echo "The current date and time is: "
	echo
	echo "$date_and_time"
	#this goes back to the main function
	main
}






#show_calendar function
show_calendar () {
	echo "Would you like to look at the current Date or future Date? [cd/fd]"
	#assigns users input to the variable cal
	read cal
	#if user chooses y then it will get the current date
	if [ $cal == "cd" ]; then	
		cal
	#if the user selects n then it will output the date that the user chooses
	elif [ $cal == "fd" ]; then
		echo "Type in the Date that you would like to look at: "
		echo
		echo "[month]"
		#this assigns the first input to the month variable
		read month 
		echo "[year]"
		#this assigns the second input to the year
		read year
		#this places those values at this point to get the specific calendar date that the user chooses.
		cal $month $year
	else
		echo "Invalid Input"
		echo
		show_calendar
	fi
	main 
}



#delete path function
delete_path () {
echo
}





#system config menu
system_config_menu () {
	echo
	echo "===================================================="
	echo "WELCOME TO THE SYSTEM CONFIGURATION INFORMATION MENU"
	echo "===================================================="
	echo
	echo "Option 1: Operating System Type"
	echo "Option 2: CPU"
	echo "Option 3: Memory"
	echo "Option 4: Hard Disk"
	echo "Option 5: File System"
	echo "Option 6: Main menu"
	#gets input from user and assigns it to this variable
	read choice_two
	if [ $choice_two == 6 ]; then
		#this takes user back to the menu
		main	
	else
		echo "Invalid Input"
		echo
		system_config_menu
	fi
}



main
