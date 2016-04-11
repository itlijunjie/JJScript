#!/bin/sh

#  decode-apk.sh
#
#
#  Created by lijunjie on 16/4/11.
#  Copyright © 2016年 lijunjie. All rights reserved.

echo "首先要下载apktool+dex2jar+jd-gui 三个工具"

apk_path=""

current_path=`pwd`

apk_zip_path=$current_path/apk.zip

apk_unzip_path=$current_path/unzip

echo $#

if [ $# -eq 1 ]
then
    apk_path=$1
else
    echo "参数错误"
    exit
fi

if [ -f $apk_path ]
then
    echo $apk_path
    cp $apk_path $apk_zip_path
    unzip $apk_zip_path -d $apk_unzip_path
else
    echo "文件不存在"
    exit;
fi

#1.生成资源文件
./apktool d $apk_path
#2.生成可查看的jar文件
./dex2jar/d2j-dex2jar.sh $apk_unzip_path/classes.dex
#3.用图形化工具打开查看
echo "请用jd-gui打开classes-dex2jar.jar查看类文件"
