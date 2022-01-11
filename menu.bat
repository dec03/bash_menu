#!/bin/bash
#this is the main function that allows the user to navigate to the different parts of the code
main () {
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



main
