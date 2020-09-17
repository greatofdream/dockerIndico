# docker for Indico
## Attention
+ redis: need set /etc/sysctl.conf if the redis can not write the data into disk
```shell
vm.overcommit_memory = 1
```

+ Apache: need set proxypass to avoid bug in user manage
```shell
	AliasMatch "^/(images|fonts)(.*)/(.+?)(__v[0-9a-f]+)?\.([^.]+)$" "/opt/indico/web/static/$1$2/$3.$5"
        AliasMatch "^/(css|dist|images|fonts)/(.*)$" "/opt/indico/web/static/$1/$2"
#AliasMatch "^/(user/api)/(.*)$" "/indico/$1/$2"
        Alias /robots.txt /opt/indico/web/static/robots.txt

        SetEnv UWSGI_SCHEME http

        ProxyPass /indico uwsgi://127.0.0.1:8008/
        ProxyPass /api/ uwsgi://127.0.0.1:8008/api/
        ProxyPass /user/ uwsgi://127.0.0.1:8008/user/
        XSendFile on                                                                                                                                                            XSendFilePath /opt/indico
```
