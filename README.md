# JJScript
    存放自己平时收集的一些脚本。
## pugongying.py（上传ipa到蒲公英的脚本）
    来源：https://github.com/answer-huang/pugongying/blob/master/pugongying.py
## releaseionic.sh（ionic打包发布到fir脚本）
<pre>
需要在./platforms/ios/cordova下的相应配置文件加上配置
build-debug.xcconfig
CODE_SIGN_IDENTITY = iPhone Developer
CODE_SIGN_IDENTITY[sdk=iphoneos*] = iPhone Developer
PROVISIONING_PROFILE = 5818b1c5
ONLY_ACTIVE_ARCH = NO

build-release.xcconfig
CODE_SIGN_IDENTITY = iPhone Developer
CODE_SIGN_IDENTITY[sdk=iphoneos*] = iPhone Developer
PROVISIONING_PROFILE = 5818b1c5

根据自己的实际情况做配置
</pre>
## releasefir.sh（fir打包发布到fir脚本）
<pre>
使用debug配置发包的时候加上ONLY_ACTIVE_ARCH=NO
</pre>
## outck.sh（根据cer和p12生成推送证书）
<pre>
ck.pem为结果文件
</pre>
## xcodebuild&xcrun.sh
<pre>
使用xcodebuild和xcrun打包生成ipa，并上传到fir
</pre>
## xcodebuild_dev.sh
<pre>
使用新的打包命令执行打包，需要使用系统自带的ruby环境
</pre>
## ExportScript.sh（制作通用的.a或者Framework）
<pre>
生成通用的库
</pre>
## decode-apk.sh（利用apktool+dex2jar+jd-gui反编译apk脚本）
<img src="https://raw.githubusercontent.com/itlijunjie/JJScript/master/image/apk_decode_dir.png" width="200px" /></br>
## 联系方式
QQ：470058952</br>
我的微信：</br>
<img src="https://raw.githubusercontent.com/itlijunjie/image/master/微信.png" width="200px"></br>
## License
JJScript is under [WTFPL](http://www.wtfpl.net/). You can do what the fuck you want with JJScript. See [LICENSE](LICENSE) file for more info.
