This is a Docker Image for ZeroJudge V3.0.0, Build with Alpine 3.6 + Tomecat 8.5 + python 3.6.1 + JAVA 1.8 + gcc(g++) 6.3 + [FreePascal Compiler](http://www.freepascal.org/) 3.0.2

# ZeroJudge 高中生程式解題系統
[ZeroJudge](https://zerojudge.tw/), An Online Judge System For Beginners. If You want the ova version(about 3.8GB) for ViutualBox running( **NOT** minimize container version about 240MB), Please download from [ZeroJudge virtual plan](https://sites.google.com/zerojudge.tw/vms/).

# How to use

You **Must Have** MySQL server to store data, You can run by docker like below:
```
docker run --name mysql -e MYSQL_ROOT_PASSWORD=db.passwd -d mysql
```
Then, You can run ZeroJudge and link to MySQL container like below:
```
docker run --name zero -e DB_HOST=mysql.ip.maybe.172.17.0.2 -e DB_PASSWORD=db.passwd -p 80:80 -d leejoneshane/zerojudge
```
Now, You can link the ZeroJudge System by http://localhost and http://localhost/ZeroJudge_Server/, Please login with user:zero password:!@#$zerojudge to manage your local ZeroJudge server.

If You need phpMyAdmin for manage database, You can run by docker like below:
```
docker run --name myadmin -e PMA_HOST=mysql.ip.maybe.172.17.0.2 -p 8888:80 -d phpmyadmin/phpmyadmin
```
When You practice coding, You may install [dev-c++](https://sourceforge.net/projects/orwelldevcpp/) in your laptop or desktop.
