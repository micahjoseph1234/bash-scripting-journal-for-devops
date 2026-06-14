#!/bin/bash

if ! command -v java >/dev/null 2>&1
then
    sudo apt update -y
    sudo apt install default-jdk -y
fi

cd /opt || exit

wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.99/bin/apache-tomcat-8.5.99.tar.gz

tar -xvzf apache-tomcat-8.5.99.tar.gz

mv apache-tomcat-8.5.99 tomcat

cd tomcat/bin || exit

./startup.sh

echo "Tomcat Started Successfully"
