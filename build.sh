#This script maintain latest 6 html files and add build no infront of filename

#/bin/bash

cd /var/lib/jenkins/workspace/html/newman

files=`ls`

for i in $files; do

   sudo mv $i $BUILD_NUMBER-$files
   sudo mv /var/lib/jenkins/workspace/html/newman/*.html /var/lib/jenkins/workspace/html/reports
done

#/bin/bash

file=`ls -t1 /var/lib/jenkins/workspace/html/reports | tail -n +7`

for i  in  $file; do
   sudo rm -rf /var/lib/jenkins/workspace/html/reports/$i
done
