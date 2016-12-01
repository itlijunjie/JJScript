#!/bin/sh

rm -rf ./build

pod install --no-repo-update

if [ $# -eq 0 ]
then
echo "\033[32m CocoaPods安装成功 \033[0m"
else
echo "\033[31m CocoaPods安装失败 \033[0m"
exit 1
fi

out_path=`date "+%Y-%m-%d-%H-%M-%S"`
base_path="xcode_build_ipa_dev"
pwd_path=`pwd`

mkdir -p ./$base_path/$out_path

api_token=""
sign_name=""
profile_name=""

xcodebuild -workspace wanduoduo.xcworkspace -scheme wanduoduo -configuration Debug -sdk iphoneos clean build CODE_SIGN_IDENTITY="$sign_name" PROVISIONING_PROFILE_SPECIFIER="$profile_name" -derivedDataPath "build"
#xcodebuild -workspace wanduoduo.xcworkspace -scheme wanduoduo -configuration Debug -sdk iphoneos clean build CODE_SIGN_IDENTITY="$sign_name" PROVISIONING_PROFILE_SPECIFIER="$profile_name" -derivedDataPath "build" | xcpretty

if [ $# -eq 0 ]
then
echo "\033[32mapp编译成功\033[0m"
else
echo "\033[31mapp编译失败\033[0m"
exit 2
fi

xcrun -sdk iphoneos  PackageApplication -v ./build/Build/Products/Debug-iphoneos/wanduoduo.app  -o $pwd_path/$base_path/$out_path/wanduoduo.ipa

if [ $# -eq 0 ]
then
echo "\033[32mipa编译成功\033[0m"
else
echo "\033[31mipa编译失败\033[0m"
exit 3
fi

echo $pwd_path/$base_path/$out_path/wanduoduo.ipa

fir p $pwd_path/$base_path/$out_path/wanduoduo.ipa -T $api_token -c 发布debug版本

echo "\033[36m完美\033[0m"

exit 0
