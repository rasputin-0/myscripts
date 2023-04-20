#! /bin/bash
echo '''
    #################################
    #     This is script to get     #
    #   	 all subdomains		    #
    #       created by heema :)     #
    #################################
'''

#take the file name 
while getopts f: files
do
	case ${files} in
		f) file=${OPTARG};;
	esac
done
#+++++++++++++++++++++++++++++++++++

echo "run subfinder ..."
cat $file | subfinder | tee 1
echo "run assetfinder ..."
cat $file | assetfinder --subs-only | tee 2
echo "run amass"
amass enum -active  -df $file| tee 3
# add the all subs in one file
cat 1 2 3 | sort -u | tee sub
cat sub | new subdomain
#remove the extra files
rm 1 2 3 sub
echo "all subdomain is ready in subdomain"
count=`wc -l subdomain`
echo "and u got $count subdomain"