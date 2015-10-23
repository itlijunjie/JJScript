#!/bin/sh

currentDir=`pwd`

pod install --no-repo-update

cd ../
cd ../

ionicHomeDir=`pwd`

ionic build --device --release ios

if [ $# -eq 0 ]
then
fir p "$currentDir/build/device/PerfectDay.ipa" -T f0bab9e48ac73ad5e7713b0b6b60 -c "发布新版本！"
#    exit                     ##不存在退出
else
a=$*
echo $a
fir p "$currentDir/build/device/PerfectDay.ipa" -T f0bab9e48ac73ad5ed713b0b6b60 -c $a

#    for a in $*             ##存在话，取参数放入a中循环
#    do
#        b=`echo $a|tr [a-z] [A-Z]`    ###将a改成大写
#        echo "CC"$b                       ##拼接成功CCA
#    done
fi