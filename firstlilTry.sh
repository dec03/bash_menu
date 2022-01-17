#!/bin/bash

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

display_result() {
  dialog --title "$1" \	#first arguement is passed as the title
    --no-collapse \
    --msgbox "$result" 0 0	#result is the thing i keep redefining to pass through commands
}
display_calender() {
 dialog --calendar \
 'This months calendar' \	#calender function
  5 50 30 1 2022
}
delete_file(){
local f="$1"	#second arguement is the file
local m="$0: file $f failed to delete."	#$0 would be the error code and $f would be wether the file deleted
if [ -f $f ] 	#if the file is a file
	then
		/bin/rm $FILE && m="$0: $f file deleted."
	else
		m="$0: $f is not a file."
fi 
	dialog --title "Remove file" --clear --msgbox "$m" 10 50
}
while true; do
  exec 3>&1
  selection=$(dialog \		#this is all the selection box
    --backtitle "System Information" \
    --title "Main menu" \	#title
    --clear \
    --cancel-label "Exit" \		#for cancelling
    --menu "Please select what you would like to do:" $HEIGHT $WIDTH 4 \ #menu initialisation
    "1" "Display System Information" \
    "2" "Display Disk Space" \
    "3" "Display time and date" \
    "4" "Display calender" \
    "5" "Show CPU information" \
    "6" "Pick a file to delete" \
    "7" "Your platform"\
    "8" "Memory information"\
    "9" "Hard Disk information"\
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Program terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac
  case $selection in	#check what is selected then goto the relevant number
    1 )
      result=$(echo "Hostname: $HOSTNAME"; uptime)	#Gets uptime information
      display_result "System Uptime Information"
      ;;
    2 )
      result=$(findmnt)		#gets mounted file system information
      display_result "Files in a mounted way"
      ;;
    3 )  
      dialog --title "System date and time" --infobox "Date and time is `date`" 8 50;
	sleep 5
      ;;
    4 )
      display_calender "this months calender"	#call the display calender function
      ;;
    5 )
	result=$(lscpu)		#gets general cpu information can use cat /proc/cpuinfo for more info on each core
	display_result "CPU info"
      ;;
    6 )
    	FILE=$(dialog --title "Delete a file" --stdout --title "Please choose a file to delete" --fselect /tmp/ 14 48) #fselect used to select from temp
    	dialog --title "Are you sure?" --yesno "Are you absolutely sure you want to delete this file" 0 0
    	if [[  $? == 0 ]]; then		#if the yes no is yes file will be deleted
	    	[ ! -z $FILE ] && delete_file "$FILE"
	    	result=$(echo "Your file has been successfully deleted")
	    	display_result "Success"
	else 
		result=$(echo "$FILE has not deleted")	#if the yes no is no the file will remain
		display_result "File deleted"
      	fi
      ;;
    7 )
    	platform='unknown'
    	unamestr=`uname`	#uname checks the platform type to determine the OS
    	if [[ "$unamestr" == 'Linux' ]]; then
   	    platform='linux'
	    elif [[ "$unamestr" == 'FreeBSD' ]]; then
        platform='freebsd'
	    fi
	result=$(echo "Your platform is $platform")
	display_result "Here is your platform"
      ;;
    8 )
    	result=$(cat /proc/meminfo)	#gets memory information
    	display_result "Your memory information"
     ;;
    9 )
    	result=$(cat home/jimbooo/hd.txt)	#i outputted it into a text file as you have to run sudo to to get hard disk info
    	display_result "Hard disk information"
    ;;
  esac
done