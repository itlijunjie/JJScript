#!/bin/sh
#使用方法：bash -l ./xcodebuild_dev.sh

basepath=$(cd `dirname $0`; pwd)
echo basepath=$basepath

pwd_path=$basepath

rm -rf $pwd_path/build

pod install --no-repo-update
if [ $# -eq 0 ]
then
    echo "\033[32mCocoaPods安装成功\033[0m"
else
    echo "\033[31mCocoaPods安装失败\033[0m"
    exit 1
fi

out_path=`date "+%Y-%m-%d-%H-%M-%S"`
base_path="xcode_build_ipa_dev"

mkdir -p $pwd_path/$base_path/$out_path

#if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
#    source ~/.rvm/scripts/rvm
#    rvm use system
#fi

xcodebuild -workspace $pwd_path/nduoduo.xcworkspace -scheme wanduoduo -configuration Debug -sdk iphoneos clean
xcodebuild archive -workspace $pwd_path/wanduoduo.xcworkspace -scheme wanduoduo -configuration Debug -archivePath $pwd_path/$base_path/$out_path/wanduoduo.xcarchive
if [ $# -eq 0 ]
then
    echo "\033[32marchive成功\033[0m"
else
    echo "\033[31marchive失败\033[0m"
    exit 2
fi

xcodebuild -exportArchive -archivePath $pwd_path/$base_path/$out_path/wanduoduo.xcarchive -exportPath $pwd_path/$base_path/$out_path -exportOptionsPlist $pwd_path/xcodebuild_dev_config.plist
if [ $# -eq 0 ]
then
    echo "\033[32mexportArchive成功\033[0m"
else
    echo "\033[31mexportArchive失败\033[0m"
    exit 3
fi

echo $pwd_path/$base_path/$out_path/wanduoduo.ipa

fir p $pwd_path/$base_path/$out_path/wanduoduo.ipa -T $api_token -c 发布debug版本

echo "\033[36m完美\033[0m"
#if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
#    source ~/.rvm/scripts/rvm
#    rvm use default
#fi
exit 0
