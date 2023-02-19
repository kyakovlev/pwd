## Environment:
Ubuntu 20.04<br>
Preinstalled SW: python 3.8.10, pip 20.0.2<br>
Docker 23.0.1<br>
Docker compose 1.29.2
## Local install via docker-compose
```
git clone https://github.com/kyakovlev/pwd.git
mkdir app
cd ./app
git clone https://github.com/yiisoft/yii2-app-basic.git #Yii 2 Basic Project Template
cd ../
vi .env #set server name, mysql setting and etc.
docker-compose up -d
curl -vvv -H "Host: server_name" http://localhost 
```
## Remote install via ansible
```
git clone https://github.com/kyakovlev/pwd.git
mkdir app
cd ./app
git clone https://github.com/yiisoft/yii2-app-basic.git #Yii 2 Basic Project Template
cd ../
vi .env #set server name, mysql setting and etc.
vi ./inventory.yml #set inventory parameters
ansible-playbook -i inventory.yml ./playbook.yml --private-key ~/.ssh/secret
curl -vvv -H "Host: server_name" http://remote_server
```
