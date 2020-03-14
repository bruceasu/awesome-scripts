#!/bin/bash

# 判断执行文件的类型，如果是一个符号链接，得到这个链接的目的路径，
# 在以前的版本中，这个任务是用 readlink -f 命令完成的。
# 这种作法稍微有些问题，比如你的系统里面可能没有readlink命令，
# 或者低版本的readlink还不支持-f参数，所以在这里先采用readlink，
# 如果readlink失败，则再用file命令和一个模式匹配来得到目的路径。
# 目前我不确定是否每个平台上的file命令都是返回symbolic link to 这种字符串，
# 如果不是，把symbolic link to 替换成你的file命令返回的那样

PREFIX=
if [ -L "${BASH_SOURCE[0]}" ]; then
	PREFIX=`readlink -f ${BASH_SOURCE[0]}`
	if [ $? -eq 0 ]; then
		PREFIX=`dirname $PREFIX`  
	else 
		PREFIX=`file ${BASH_SOURCE[0]}`
		PREFIX=${PREFIX##*symbolic link to }
		PREFIX=`dirname $PREFIX`
	fi
else
	PREFIX=`dirname ${BASH_SOURCE[0]}`
fi

# 在这里我判断得到的路径是否是绝对路径，如果不是绝对
# 路径，我要再做一些处理得到绝对路径
case $PREFIX in
	/*)
		;;
	*)
		cd $PREFIX
		PREFIX=`pwd`
		;;
esac

#PROG_HOME="$(cd $PREFIX  && pwd)"
#echo $ASQL_HOME

PROG_HOME=$PREFIX

U=${1:-root}
P=${2:-3307}
H=${3:-localhost}
mysql -h$H -u$U -P$P -S${PROG_HOME}/mysql.sock -p -e "SHOW VARIABLES"

