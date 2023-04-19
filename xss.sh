#!/bin/bash
# cearte automation xss scanner 
echo '''
    #################################
    #   This tool or script is      #
    #  automation scanner for xss   #
    #       created by heema :)     #
    #################################
'''
mydir=`pwd`
sleep 2
#take the file of subdomains
echo " run tool with in sudo termenal 'xss.sh -f FILE_NANE_Of_SUBS"
while getopts f: files
do
    case "${files}" in
        f) file=${OPTARG};;
    esac
done


#
urls(){
	# run paramspider to get more urls
	python3 /home/heema/heema/tools/ParamSpider/paramspider.py -d $mydir/$file
	# run gau
	cat $file | gau | tee urls2
	#run waybackurls
	cat $file | waybackurls | tee urls3
	# get all urls in one file
	cat $mydir/output/$mydir/$file".txt" url2 | anew urls3
	cat urls3 |sort -u |tee urls
	# remove urls file
	rm -rf output/ urls2 urls3
}
#run the function to get all urls
urls
replace(){

	cat urls| gf xss | tee -a xss1.txt | qsreplace FUZZ |tee xss2.txt


}
replace
simple(){
	#find xss with kxss
	cat xss2.txt | kxss | tee kxss.txt
	# remove the extra files
	sudo rm -rf xss xss1.txt xss2.txt
}
simple