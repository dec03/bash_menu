#!/bin/bash

main () {
echo "Option 1: Date/time"
echo "Option 2: Calendar"
echo "Option 3: Delete"
echo "Option 4: System configuration"
echo "Option 5: Exit"	
read choice
if [ $choice == 1 ]; then
date_time
fi
}



date_time () {
date
read date_and_time
echo "$date_and_time"
main
}





main
