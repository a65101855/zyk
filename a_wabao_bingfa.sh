#!/bin/bash
# new Env('BBK-挖宝并发助力版');
# export JD_LOG_XYZ_TOKEN="从机器人获取的token"
# export Proxy_Url="代理网址 例如：星空、熊猫 生成选择txt 一次一个"
# export WABAO_SUSSCESS_COUNT="111" #挖宝助力次数限制，助力111次
# export WABAO_PINS="指定pin助力，多个用英文&分割"
# export WABAO_BINGFA="true" #挖宝并发版任务默认不执行，启用需设置环境变量
# export WABAO_BAN_PINS="123&456" #挖宝助力时这里指定的pin将不助力(黑名单)
# 支持PIN或者链接方式(`wabaolist.txt`存放需要助力的URL,一行一个)
pwd
_ftype=""
get_arch=`arch`
echo $get_arch
if [[ $get_arch =~ "x86_64" ]];then
	_ftype="linux-amd64"
elif [[ $get_arch =~ "x86" ]];then
	_ftype="linux-386"
elif [[ $get_arch =~ "i386" ]];then
	_ftype="linux-386"
elif [[ $get_arch =~ "aarch64" ]];then
	_ftype="linux-arm64"
elif [[ $get_arch =~ "arm" ]];then
	_ftype="linux-arm"
else
	_ftype=""
fi

if [ $_ftype == "" ]; then
	echo "不支持的架构$get_arch"
else
	echo "执行$_ftype"
    if [ -f "$PWD/BBK/$_ftype.bbk" ]; then
        echo "$PWD/BBK/$_ftype.bbk"
        eval "chmod +x ./BBK/$_ftype.bbk"
        eval "./BBK/$_ftype.bbk -t wabao_bingfa"
    else
        if [ ! -f "$PWD/$_ftype.bbk" ]; then
            echo "在$PWD/BBK目录、$PWD目录下均未找到文件$_ftype.bbk"
            exit 1
        fi
        echo "$PWD/$_ftype.bbk"
        eval "chmod +x $PWD/$_ftype.bbk"
        eval "$PWD/$_ftype.bbk -t wabao_bingfa"
    fi
fi