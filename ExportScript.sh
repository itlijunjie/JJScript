#!/bin/bash
#
# 介绍：
# 这个脚本全部自动化编译各指令集静态库后合并。现在支持指令集有armv7 armv7s arm64 i386 x86_64
#
# 使用：
#  首先cd 到xcode工程目录 然后运行 "sh ./build.sh"  PS:xcode不能含有xcodebuild的Runscript切记！
#
# 验证:
#  cd 到静态库目录  然后 "lipo -info 静态库名称.a "
#
# TODO :
# 1.完成宏定义，解决多次修改工程名字的问题
# 2.增加SVN、Git版本号
# 3.增加Buildnotes
# 4.完成规范化命名
# http://blog.csdn.net/ciyuewuxing/article/details/23749953

#工程的名字
MY_PROJECT_NAME="CommonUtil.xcodeproj"
#编译target的名字
MY_TARGET_NAME="CommonUtil"
#LIB名字
MY_STATIC_LIB="${PROJECT_NAME}.framework"

MY_CONFIGURATION="Release"

# armv7
MY_ARMV7_BUILD_PATH='temp/armv7'
MY_CURRENT_BUILD_PATH="${MY_ARMV7_BUILD_PATH}"

xcodebuild -project "${MY_PROJECT_NAME}" -target "${MY_TARGET_NAME}" -configuration ${MY_CONFIGURATION}  -sdk 'iphoneos' CONFIGURATION_BUILD_DIR="${MY_CURRENT_BUILD_PATH}" ARCHS='armv7' VALID_ARCHS='armv7' IPHONEOS_DEPLOYMENT_TARGET='7.0' clean build

# armv7s
MY_ARMV7S_BUILD_PATH='temp/armv7S'
MY_CURRENT_BUILD_PATH="${MY_ARMV7S_BUILD_PATH}"

xcodebuild -project "${MY_PROJECT_NAME}" -target "${MY_TARGET_NAME}" -configuration ${MY_CONFIGURATION}  -sdk 'iphoneos' CONFIGURATION_BUILD_DIR="${MY_CURRENT_BUILD_PATH}" ARCHS='armv7s' VALID_ARCHS='armv7s' IPHONEOS_DEPLOYMENT_TARGET='7.0' clean build

# arm64
MY_ARM64_BUILD_PATH='temp/arm64'
MY_CURRENT_BUILD_PATH="${MY_ARM64_BUILD_PATH}"

xcodebuild -project "${MY_PROJECT_NAME}" -target "${MY_TARGET_NAME}" -configuration ${MY_CONFIGURATION} -sdk 'iphoneos' CONFIGURATION_BUILD_DIR="${MY_CURRENT_BUILD_PATH}" ARCHS='arm64' VALID_ARCHS='arm64' IPHONEOS_DEPLOYMENT_TARGET='7.0'  clean build

# i386
MY_I386_BUILD_PATH='temp/i386'
MY_CURRENT_BUILD_PATH="${MY_I386_BUILD_PATH}"

xcodebuild -project "${MY_PROJECT_NAME}" -target "${MY_TARGET_NAME}" -configuration ${MY_CONFIGURATION} -sdk 'iphonesimulator' CONFIGURATION_BUILD_DIR="${MY_CURRENT_BUILD_PATH}" ARCHS='i386' VALID_ARCHS='i386' IPHONEOS_DEPLOYMENT_TARGET='7.0' clean build

# x86_64
MY_X86_64_BUILD_PATH='temp/x86_64'
MY_CURRENT_BUILD_PATH="${MY_X86_64_BUILD_PATH}"

xcodebuild -project "${MY_PROJECT_NAME}" -target "${MY_TARGET_NAME}" -configuration ${MY_CONFIGURATION} -sdk 'iphonesimulator' CONFIGURATION_BUILD_DIR="${MY_CURRENT_BUILD_PATH}" ARCHS='x86_64' VALID_ARCHS='x86_64' IPHONEOS_DEPLOYMENT_TARGET='7.0' clean build

# #####################
#
# # # 需要重新设置编译target的名字，
#
# #####################

#最终静态库路径
MY_FINAL_BUILD_PATH='lib/'
if [ ! -d "${MY_FINAL_BUILD_PATH}" ]; then
mkdir -p "${MY_FINAL_BUILD_PATH}"
fi

#最终静态库名字
MY_FINAL_STATIC_LIB="${MY_TARGET_NAME}.framework"
if [ ! -d "${MY_FINAL_BUILD_PATH}${MY_TARGET_NAME}.framework" ]; then
mkdir -p "${MY_FINAL_BUILD_PATH}${MY_TARGET_NAME}.framework"
fi

cp -r "${MY_ARMV7_BUILD_PATH}/${MY_STATIC_LIB}/." "${MY_FINAL_BUILD_PATH}${MY_TARGET_NAME}.framework"

# 合并不同版本的编译库
lipo -create "${MY_ARMV7_BUILD_PATH}/${MY_STATIC_LIB}/${MY_TARGET_NAME}" "${MY_ARMV7S_BUILD_PATH}/${MY_STATIC_LIB}/${MY_TARGET_NAME}" "${MY_ARM64_BUILD_PATH}/${MY_STATIC_LIB}/${MY_TARGET_NAME}" "${MY_I386_BUILD_PATH}/${MY_STATIC_LIB}/${MY_TARGET_NAME}" "${MY_X86_64_BUILD_PATH}/${MY_STATIC_LIB}/${MY_TARGET_NAME}" -create -output "./${MY_FINAL_BUILD_PATH}${MY_FINAL_STATIC_LIB}/${MY_TARGET_NAME}"

rm -rf 'temp'
rm -rf 'build'

open "${MY_FINAL_BUILD_PATH}"
