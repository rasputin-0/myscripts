#! /bin/bash
echo '''
    #################################
    #  This is script to search for #
    #   	 subdomain take over    #
    #       created by heema :)     #
    #################################
'''

dir1=`pwd`
 
#take the file name 
while getopts f: files
do
	case ${files} in
		f) file=${OPTARG};;
	esac
done
#+++++++++++++++++++++++++++++++++++
# get all 404 domain and save it in 404.txt

cat $file | httpx -mc 404 | tee 404.txt

# run tool call takeover 
# cd ~/heema/tools/takeover/
# python3 ~/heema/tools/takeover/takeover.py -l 404.txt

#run nuclei
nuclei -l 404.txt -t ~/nuclei-templates/takeovers/detect-all-takeovers.yaml