#! /bin/bash
#######	This tool to get api_keys and tonken from js files	##
echo '''
    #################################
    # This is script for scanner js #
    #  file for api keys or tokens  #
    #       created by heema :)     #
    #################################
'''
# Get The file name with arge
while getopts f: files
do
	case "${files}" in
		f) file=${OPTARG};;
	esac
done

# Get All JS Files and save it in js.txt

cat $file | grep '\.js$' | httpx -status-code -mc 200 -content-type | grep 'application/javascript' | tee js.txt


#grep the js files
echo "grep the js files"
cat $file | grep -aEo 'https?://[^ ]+' | sed 's/]$//' | sort -u | grep -aEi "\.(js)" | anew js.txt


#send the js file to nuclei
echo "send the js file to nuclei"
nuclei -l js.txt -t /home/heema/nuclei-templates/exposures/tokens/generic/
echo 'IF U WONT TO KNOW HO USE THE TOKEN U CAN USE THIS COMMAND "nuclei -t ~/nuclei-templates/token-spray/ -var $ur_token" '




#################################################################################
#### if u want to search for apikey or token u can uncomment the next code     ##
#################################################################################
# #search for token or api_key
# echo -n "do u want to search for ApiKey Or Token?[y/n] : "
# read ans 
# if [ $ans == 'y' ]
# then
# 	search
# 	echo -n "search for ather apiKey or exit [c/e] : "
# 	read ans2
# 	if [ $ans2 == "c" ]
# 	then
# 		search
# 	else
# 		echo "happy hacking bay :) !"
# 		break
# 	fi

# else
# 	echo "happy hacking bay :) !"
# 	break
# fi

# function search (){
# 	echo -n "enter ur token or apiKey : "
# 	read token
# 	nuclei -t ~/nuclei-templates/token-spray/ -var $token
# }