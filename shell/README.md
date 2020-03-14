unixtools
=========

我在unixtools下积累的常用工具

Java线程过高问题排查
```
curl -sLk "https://raw.github.com/suk/shell/master/javatop.sh" | ksh -s 5 `pgrep -u admin java`
```

Java Dump脚本
```
/opt/taobao/java/bin/jmap -dump:live,format=b,file=heap-`date +%Y%m%d%H%M`.bin `pgrep -u admin java`
```
