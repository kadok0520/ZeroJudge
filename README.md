This is a Docker Image for ZeroJudge V3.0.0, Build with Alpine 3.6 + Tomecat 8.5 + python 3.6.1 + JAVA 1.8 + gcc(g++) 6.3 + [FreePascal Compiler](http://www.freepascal.org/) 3.0.2

# ZeroJudge 高中生程式解題系統
ZeroJudge, An Online Judge System For Beginners

# Official site
https://zerojudge.tw/

# ZeroJudge 虛擬機計畫 You can download .ova here
https://sites.google.com/zerojudge.tw/vms/

# How to use

You **Must Have** MySQL server to store data, You can run by docker like below:

docker run --name mysql -e MYSQL_ROOT_PASSWORD=db.passwd -d mysql

Then, You can run ZeroJudge and link to MySQL container like below:

docker run --name zero -e DB_HOST=mysql.container.ip -e DB_USER=root -e DB_PASSWORD=db.passwd -p 80:80 -p 8080:8080 -d leejoneshane/zerojudge

Now, You can link the ZeroJudge System by http://localhost and http://localhost/ZeroJudge_Server/

When You practice coding, You may install [dev-c++](https://sourceforge.net/projects/orwelldevcpp/) in your laptop or desktop.
