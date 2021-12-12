#
#	Database Loading Script
#
#	Version 0.1.0.0 2002/04/05 by: David Warden.
#	Copyright (C) 2002 McGraw-Hill Companies Inc. All Rights Reserved.
#
#		This script will load the sample data for use with the book 
# Database Management Systems by Raghu Ramakrishnan and Johannes Gehrke.
#
#
#	Useage
#
#	To insure this script is executable type: "chmod 700". Then type 
# "sh dbbook.sh" to run the script.
#
#	
#	Requirements
#
#	This script requires a Unix system, with the Oracle executables in
# your PATH statement. Your account and Oralce must be properly configured. 
# See the information on configuring your account for more informaion.
#
#	Get Password Informaion
#
printf "Enter your Oracle username: "
read ORACLE_USERNAME 
stty -echo
printf "Enter your Oracle password: "
read ORACLE_PASSWORD 
stty echo
#
#
#	Setup Tables
#
	echo
	echo "Creating Tables."
	sqlplus -S $ORACLE_USERNAME/$ORACLE_PASSWORD \
		@dbbook.sql /NOLOG >/dev/null </dev/null
#
#	Bulk Load Data
#
	sqlldr $ORACLE_USERNAME/$ORACLE_PASSWORD \
		control=student.ctl  silent='(all)' log=/dev/null
#
#	Check for Error
#	
	if [ $? -ne 0 ]; then
		echo "There was an error (specified above) connecting to Oracle."
		echo "Please verify your configuration, username, and password."
		echo "You may try again by typing: bookinst"
		exit 127
	fi
#
#   Remainder of Data
#			
	echo "Bulk Loading Data. This may take a few moments."
	sqlldr $ORACLE_USERNAME/$ORACLE_PASSWORD \
		control=faculty.ctl  silent='(all)' log=/dev/null
	sqlldr $ORACLE_USERNAME/$ORACLE_PASSWORD \
		control=class.ctl  silent='(all)' log=/dev/null
	sqlldr $ORACLE_USERNAME/$ORACLE_PASSWORD \
		control=enrolled.ctl  silent='(all)' log=/dev/null
	sqlldr $ORACLE_USERNAME/$ORACLE_PASSWORD \
		control=emp.ctl  silent='(all)' log=/dev/null
	sqlldr $ORACLE_USERNAME/$ORACLE_PASSWORD \
		control=dept.ctl  silent='(all)' log=/dev/null
	sqlldr $ORACLE_USERNAME/$ORACLE_PASSWORD \
		control=works.ctl  silent='(all)' log=/dev/null
	sqlldr $ORACLE_USERNAME/$ORACLE_PASSWORD \
		control=parts.ctl  silent='(all)' log=/dev/null
	sqlldr $ORACLE_USERNAME/$ORACLE_PASSWORD \
		control=suppliers.ctl  silent='(all)' log=/dev/null
	sqlldr $ORACLE_USERNAME/$ORACLE_PASSWORD \
		control=catalog.ctl  silent='(all)' log=/dev/null
	sqlldr $ORACLE_USERNAME/$ORACLE_PASSWORD \
		control=aircraft.ctl  silent='(all)' log=/dev/null
	sqlldr $ORACLE_USERNAME/$ORACLE_PASSWORD \
		control=employees.ctl  silent='(all)' log=/dev/null
	sqlldr $ORACLE_USERNAME/$ORACLE_PASSWORD \
		control=flights.ctl  silent='(all)' log=/dev/null
	sqlldr $ORACLE_USERNAME/$ORACLE_PASSWORD \
		control=certified.ctl  silent='(all)' log=/dev/null
	sqlldr $ORACLE_USERNAME/$ORACLE_PASSWORD \
		control=sailors.ctl  silent='(all)' log=/dev/null
#		
#
#	Remove Password From Memory.
#
unset ORACLE_USERNAME
unset ORACLE_PASSWORD
echo "Done. The sample data is now loaded in Oracle."
#
#
#	End Program
#
exit 0