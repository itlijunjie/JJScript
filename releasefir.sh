#!/bin/sh

pod install --no-repo-update

out_path=`date "+%Y-%m-%d-%H-%M-%S"`

if [ $# -eq 0 ]
then
fir b ./ -w -S PerfectDay -p -T f0bab9e48ac73ad5edeff7713b0b6b60 -C Release -c 发布新版本 CODE_SIGN_IDENTITY="iPhone Developer" PROVISIONING_PROFILE=85b1de43-eead-4c-995e-1cb92ff13ece -o ./fir_build_ipa/$out_path
#    exit                     ##不存在退出
else
a=$*
echo $a
fir b ./ -w -S PerfectDay -p -T f0bab9e48ac73ad5edeff7713b0b6b60 -C Release -c $a CODE_SIGN_IDENTITY="iPhone Developer" PROVISIONING_PROFILE=85b1de43-eead-4c-995e-1cb92ff13ece -o ./fir_build_ipa/$out_path

#    for a in $*             ##存在话，取参数放入a中循环
#    do
#        b=`echo $a|tr [a-z] [A-Z]`    ###将a改成大写
#        echo "CC"$b                       ##拼接成功CCA
#    done
fi

