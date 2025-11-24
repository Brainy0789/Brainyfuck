@echo off
color 0a
cd ..
@echo on

echo This shouldn't take long...

haxelib setup C:/haxelib
haxelib install hxcpp > /dev/null --quiet

echo Finished!