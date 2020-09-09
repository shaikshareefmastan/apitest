#This script maintain latest 6 html files and add build no infront of filename

#/bin/bash

cd /home/cmteam/jenkins/html

files=`ls`

for i in $files; do

   sudo mv $i $BUILD_NUMBER-$files
   sudo mv /home/cmteam/jenkins/html/*.html /home/cmteam/jenkins/reports
done

#/bin/bash

file=`ls -t1 /home/cmteam/jenkins/reports | tail -n +2`

for i  in  $file; do
   sudo rm -rf /home/cmteam/jenkins/reports/$i
done
