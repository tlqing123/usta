@ECHO OFF

git add . -A

git commit -a -m %1

git push origin master
