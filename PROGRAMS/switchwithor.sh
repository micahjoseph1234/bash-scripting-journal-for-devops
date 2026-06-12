#!/bin/bash

echo -n "Enter a character: "
read CHAR

case $CHAR in
	a | A) # Test for both Lower or Upper case letter
		# You may write commands in this fashion too!!, means multiline commands
		echo "You entered $CHAR which is a vowel"
		;; # Terminates each option
	e | E) 
		echo "You entered $CHAR which is a vowel"
		;;
	i | I) 
		echo "You entered $CHAR which is a vowel"
		;;
	o | O) 
		echo "You entered $CHAR which is a vowel"
		;;
	u | U) 
		echo "You entered $CHAR which is a vowel"
		;;
	*)  # Defaults to everything else
		echo "You entered $CHAR which is not a vowel"
		;;
esac
