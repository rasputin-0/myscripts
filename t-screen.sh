#! /bin/bash
#this is script to take screens for subdomain with tools called "EyeWitness"

echo '''
    #################################
    #   This tool or script to take #
    #    screenshot for subdomain   #
    #       created by heema :)     #
    #################################
'''

# get the pwd
dir=`pwd`

# select file subdomain in $1
echo " run tool with 'sudo screen -u FILE_NANE"
while getopts f: files
do
    case "${files}" in
        f) file=${OPTARG};;
    esac
done
#cp file to EyeWitness directory
cp $file /home/heema/heema/tools/EyeWitness/Python/

#open the tool dir
cd /home/heema/heema/tools/EyeWitness/Python/
# run the tools
echo 'n' | python3 EyeWitness.py -f $file

#mv dir of content screenshots to target dir
dirname=`ls |grep "2023"`
echo $dirname
#move screen directory to target file
mv $dirname $dir
cd /home/heema/heema/tools/EyeWitness/Python/
rm -rf $dirname $file