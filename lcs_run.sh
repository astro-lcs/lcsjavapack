#!/bin/sh
. ./function.sh

Defaul_VER=0.0.1
SET_VER=${Defaul_VER}

Defaul_Project=JAVA_PACK

if [ "$1" == "" ]; then
   echo "Bulid ${Defaul_Project} Service"	
   echo "Please Usage sh lcs_run.sh help"	
elif [ "$1" == "$1" ]; then
   echo "Bulid ${Defaul_Project} Service $1 $VER"	

    case $1 in
       "help")
		echo "Bulid ${Defaul_Project} Service: $version"  
##### HELP LCS Service#######
		echo "help         ${Defaul_Project} Service information"
		echo "rm           Remove  Docker Server"
		echo "rmi          Remove  Docker Server and Remove Docker Images"
		echo "monitor      Monitor Docker SERVER"
		echo "up           All Run Bulid"
		echo "ver          output version ${SET_VER} information and exit"
##### The code END ############
    	;;
	"up")
        all_run
		echo "RUN ALL"
#####  The code END #############
    	;;
	"pack")
        package_run
		echo "RUN ALL"
#####  The code END #############
    	;;
    "monitor")
		monitor_run
		echo "Monitor Docker SERVER"	
#####  The code END #############
		;;
    "rm")
		stop_kill
	    echo "Remove  Docker Server"
#####  The code END #############
		;;
    "rmi")
		kill_all
		echo "Remove  Docker Server and Docker Images"
#####  The code END #############
        ;;	
    "ver")
		echo "Bulid ${Defaul_Project} Service   version information"  
        echo "Bulid ${Defaul_Project} Service:  Date:"${CreateName}
##### code The END
    	;;

	*)
      	echo "Please Usage sh lcs_run.sh help"
	;;
    esac
    
else
	    echo "Unknown option argument"
        echo "More info with: help"
fi
