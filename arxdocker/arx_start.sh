#!/bin/sh

if [ ! -d "/app/licenses" ]
then
echo "No license folder found, creating.."
mkdir /app/licenses
fi

#if [ -f "/app/licenses/9204801-1553763649.alc" ]
if [ $(ls /app/licenses/*.alc 2>/dev/null | wc -l) -gt 0 ]; then
  haslicense=true
  echo "License files found";
else
  haslicense=false
  echo "No license files found";
fi

if [ -f "/app/db.build" ] && [ $haslicense = true ]
then
    echo "Database build file exists and licenses are valid, starting ARX.."
    java -jar /app/server.jar
fi

if [ ! -f "/app/db.build" ] && [ $haslicense = true ]
then
    echo "License found. No database build file, assuming first start. Copying application files to persistent folder.."
    cp -r /app_tmp/* /app/
    echo "Starting ARX.."
    java -jar /app/server.jar
fi

if [ $haslicense = false ]
then
    echo "No license found. Place the .alc license files in the license folder"
    exit
fi
