#!/bin/bash

MAJORVERSION=`cat MAJORVERSION`
MINORVERSION=`cat MINORVERSION`
REVISION=`cat REVISION`

case $1 in
    "rev") VERSIONFILE="REVISION";;
    "major") VERSIONFILE="MAJORVERSION" ;;
    *) VERSIONFILE="MINORVERSION" ;;
esac

echo "Exists tags:"
git tag -l 'v*'


echo "hi hello version is v${MAJORVERSION}.${MINORVERSION}.${REVISION}"



read -p 'Add next version? [Y/N]: ' -i Y ifnextver
case $ifnextver in
Y|y) 
    case $1 in
        "rev") let "REVISION += 1" ;;
        "major")
            let "MAJORVERSION += 1"
            REVISION=0
            ;;
        *) let "MINORVERSION += 1" ;;
    esac
    echo "New version name: v${MAJORVERSION}.${MINORVERSION}.${REVISION}"
    ;;
N|n)
    read -p "Write new $VERSIONFILE number: " -i Y newver
    case $1 in
        "rev") REVISION=$newver ;;
        "major")
            MAJORVERSION=$newver
            REVISION=0
            ;;
        *) MINORVERSION=$newver ;;
    esac
    echo "New version name: v${MAJORVERSION}.${MINORVERSION}.${REVISION}"
    ;;
*) exit ;;
esac

echo $MAJORVERSION > MAJORVERSION
echo $REVISION > REVISION
echo $MINORVERSION > MINORVERSION

git add MAJORVERSION REVISION MINORVERSION
git commit -m "Set new version"
git tag "v${MAJORVERSION}.${MINORVERSION}.${REVISION}" -f
git push origin master
git push origin "v${MAJORVERSION}.${MINORVERSION}.${REVISION}"
