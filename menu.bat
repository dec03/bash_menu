#!/bin/bash
#this is the main function that allows the user to navigate to the different parts of the code
main () {
echo
echo
echo "WELCOME TO THE MAIN MENU"
echo
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
fi





if [ $choice == 4 ]; then
#this calls the system configuration menu
system_config_menu
fi




#this kills the program
if [ $choice == 5 ]; then
kill
fi
}


#date_time function
date_time () {
#this assigns the date to the date_and_time variable
date_and_time=$(date)
#this prints the date and time
echo "The current date and time is: $date_and_time"
echo
#this goes back to the main function
main
}


#system config menu
system_config_menu () {
echo
echo
echo "WELCOME TO THE SYSTEM CONFIGURATION INFORMATION MENU"
echo
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
fi
}





main
