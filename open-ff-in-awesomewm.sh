#!/bin/bash

# open-terminal-in-awesomewm.sh

echo "actual command;"
awesome-client 'return ""'

ISAWESOMEORNOT="$(awesome-client 'return ""' | grep string | grep -w "string" | xargs)"

if [ -z ${ISAWESOMEORNOT+x} ]; then echo "ISAWESOMEORNOT is unset"; else echo "ISAWESOMEORNOT is set to '$ISAWESOMEORNOT'"; fi

echo "is awesome or not;"
echo $ISAWESOMEORNOT


if [ $ISAWESOMEORNOT -o "string" ]
then
echo "You are using awesomewm, run code." && firefox &
exit
if ! [ $ISAWESOMEORNOT -o "string" ]
then
echo "You are not using awesomewm, don't run code. Exiting." && exit
fi
fi
echo "Code bypassed without success. Must not be awesome. Don't run code." && exit
exit

