#!/bin/sh

#需要2个变量 cer的路径 p12的路径

echo "这是一个简单的脚本，需要两个参数，第一个是cer目录，第二个是p12的目录。\n建议将导出p12的密码和生成key的密码设置成一样，这样不至于记忆混淆^_^"

if [ $# -lt 2 ];then #参数小于两个就不要玩儿了

echo "执行失败。 参数小于2\n"

exit

fi

projectName="out"

cerPath=$1
echo "cer路径"$cerPath"\n"

p12Path=$2
echo "p12路径"$p12Path"\n"

certName=$projectName"cert.pem"

keyName=$projectName"key.pem"

ckName=$projectName"ck.pem"

openssl x509 -in $cerPath -inform der -out $certName

openssl pkcs12 -nocerts -out $keyName -in $p12Path

cat $certName $keyName > $ckName

echo "\n\n\n"
echo "测试脚本：\n"

echo "telnet gateway.sandbox.push.apple.com 2195\n"

echo "openssl s_client -connect gateway.sandbox.push.apple.com:2195 -cert "$certName" -key "$keyName"\n"
echo "\n\n\n"