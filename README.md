
1、下载项目文件到你的系统<br>
```
$ git clone https://github.com/RobbieHan/gistandard.git<br>
```

2、进入项目目录，拷贝和修改配置文件<br>
```
$ cd gistandard
$ mkdir -p /sandbox/nginx 
$ cp config/nginx.conf /sandbox/nginx/
$ cp -r media /sandbox
$ vim /sandbox/nginx/nginx.conf
# 修改nginx配置文件中 server标签下的 server_name 为你系统的地址IP 或域名（sandbox安装完成通过这个地址来访问）
```
3、运行容器
```
$ docker-compose up -d
```
等等等等.....<br>
查看容器运行状态：<br>
```
$ docker-compose ps <br>
       Name                     Command               State         Ports       
--------------------------------------------------------------------------------
gistandard_mysql_1   docker-entrypoint.sh mysql ...   Up      3306/tcp          
gistandard_web_1     bash -c uwsgi config/sandb ...   Up      0.0.0.0:80->80/tcp

```
4、导入数据库文件
```
$ docker cp db_tools/data/basic_data.sql gistandard_mysql_1:/tmp
$ docker-compose exec mysql bash<br>
$ mysql -uddadmin -p1234@abcd.com gistandard < /tmp/basic_data.sql
```

5、访问系统：<br>
http://your_ip   初始用户 admin  密码 !qaz@wsx <br>

## 3.2 本地环境运行
如果只是想查看代码和系统功能，可以在本地windows环境下临时运行项目，或者使用开发工具运行项目<br>
1、从github上下载项目文件到本地，或者使用git克隆项目 <br>
2、在windows上安装python3.6环境（也可以使用python虚拟环境，python环境的安装方法网上很多，这里不再写了）<br>
3、修改gistandard/gistandard/settings.py文件中数据库连接配置DATABASES, 本地运行使用db.sqlite3数据库，内含测试数据 <br>
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

4、安装依赖包，打开CMD命令行，进入项目主目录运行下面命令安装依赖包：

**注意：** 
- 本地环境使用的是sqlite3数据库，安装依赖包前可以先将requirements文件中的mysqlclient那一行删掉，这个包是用来连接mysql数据库使用的，通常windows下安装这个包会报错，解决办法我在知乎境部署的文档中都有写过。
- 我windows下使用的是python虚拟环境，所以我下面CMD命令行开头是(gistandard)这个是我虚拟环境的名称，虚拟环境的使用方法也可以网上找下，或者关注我的知乎专栏，环境部署文档中都有介绍。

```
(gistandard) D:\ProjectFile\gistandard>pip install -r requirements
```


5、运行项目，接着第4步，在CMD命令窗口输入项目运行命令：
```
(gistandard) D:\ProjectFile\gistandard>python manage.py runserver
Performing system checks...

System check identified no issues (0 silenced).
November 05, 2018 - 11:45:37
Django version 1.11.6, using settings 'gistandard.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CTRL-BREAK.

```

项目已经成功运行，可以通过http://127.0.0.1:8000 访问系统，用户名 admin, 密码: !qaz@wsx <br>
