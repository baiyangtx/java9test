#/bin/bash 
cd `dirname $0`
MOD_NAME=com.zyx.m
MOD_PATH=com/zyx/m

rm mods/ -rf
mkdir -p mods

find -name "*.java" | xargs javac -d mods 

echo "complied"

rm lib/ -rf 
mkdir lib 
jar --create --file lib/main.jar --main-class $MOD_NAME.Main -C mods . 

# start java app user java module 
java --module-path lib -m  $MOD_NAME

