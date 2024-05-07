# session-10
[Session 10](https://www.youtube.com/watch?v=XQ15cL16R8Q&list=PL1jY4BuFJn1efO4Sv57kuxMBLt1ThyyUv&index=12)


## 01:00
## 01:30 R dbms are heavy applications

## 02:00
mongo db    
shipping    
my sql  these are t3.medium
## 02:30
## 03:00
## 03:30
## 04:00 t3.micro 6 servers

best approach is to setup from right to left


if manual process is clear then automation is very easy


## 01:00
## 01:30
## 02:00
## 02:30
## 03:00
## 03:30
## 04:00
## 04:30
## 05:00
## 05:30
## 06:00
## 06:30
## 07:00
## 07:30
## 08:00
## 08:30
## 09:00 config of all servers
mongodb

## 09:30
## 10:00
## 10:30
## 11:00
## 11:30
## 12:00
## 12:30
## 13:00
## 13:30
## 14:00
## 14:30
## 15:00



## 15:30
## 16:00
## 16:30
## 17:00
## 17:30
## 18:00
## 18:30
## 19:00
## 19:30
## 20:00
## 20:30
## 21:00
## 21:30
## 22:00
## 22:30
## 23:00
## 23:30
## 24:00
## 24:30
## 25:00
## 25:30
## 26:00
## 26:30
## 27:00
## 27:30
## 28:00
## 28:30
## 29:00
## 29:30
## 30:00
## 30:30
## 31:00
## 31:30

class till servers
## 32:00
## 32:30
## 33:00
## 33:30
## 34:00 quiz
## 34:30
## 35:00
## 35:30
## 36:00
## 36:30
## 37:00
## 37:30
## 38:00
## 38:30
## 39:00
## 39:30
## 40:00
## 40:30
## 41:00
## 41:30
## 42:00
## 42:30
## 43:00
## 43:30
## 44:00
## 44:30
## 45:00
## 45:30
## 46:00
## 46:30
## 47:00
## 47:30
## 48:00
## 48:30
## 49:00
## 49:30
## 50:00
## 50:30
## 51:00
## 51:30
## 52:00
## 52:30 quiz end shipping start



## 53:00
## 53:30
## 54:00
## 54:30
## 55:00
## 55:30
## 56:00
## 56:30
## 57:00 queue rabbitmq
## 57:30
## 58:00
## 58:30
## 59:00
## 59:30
## 01:00:00
01:00:30
01:01:00
01:01:30
01:02:00
01:02:30
01:03:00
01:03:30
01:04:00
01:04:30
01:05:00
01:05:30
01:06:00
01:06:30
01:07:00
01:07:30
01:08:00
01:08:30
01:09:00
01:09:30
01:10:00
01:10:30
01:11:00
01:11:30
01:12:00
01:12:30
01:13:00
01:13:30
01:14:00
01:14:30
01:15:00
01:15:30
01:16:00
01:16:30
01:17:00
01:17:30
01:18:00
01:18:30
01:19:00
01:19:30
01:20:00
01:20:30
01:21:00
01:21:30
01:22:00
01:22:30
01:23:00
01:23:30
01:24:00
01:24:30
01:25:00
01:25:30
01:26:00
01:26:30
01:27:00
01:27:30
01:28:00
01:28:30
01:29:00
01:29:30
01:30:00
01:30:30
01:31:00
01:31:30
01:32:00
01:32:30
01:33:00
01:33:30
01:34:00
01:34:30
01:35:00
01:35:30
01:36:00
01:36:30
01:37:00
01:37:30
01:38:00
01:38:30
01:39:00
01:39:30
01:40:00
01:40:30
01:41:00
01:41:30
01:42:00
01:42:30
01:43:00
01:43:30
01:44:00
01:44:30
01:45:00
01:45:30
01:46:00
01:46:30
01:47:00
01:47:30
01:48:00
01:48:30
01:49:00
01:49:30
01:50:00
01:50:30
01:51:00
01:51:30
01:52:00
01:52:30
01:53:00
01:53:30
01:54:00
01:54:30
01:55:00
01:55:30
01:56:00
01:56:30
01:57:00
01:57:30


Deployment
---------------
developer will update the code
he will push to some location as zip
download new code
stop the server --> stop catalogue
remove old code
unzip new code
restart the server
6hours --> testing


RabbitMQ --> Messaging Queue Database

synchronous --> asynchronous

http/s --> synchronous

server should be always up and running...
400/500

asynchronous
--------------------
client --> messaging broker --> server

sivakumar --> ramesh

there will be a queue for ramesh

sivakumar --> ramesh queue

ramesh whatsapp --> subscribed to ramesh queue

if online --> message wil be delivered

when ramesh gets online --> ramesh whatsapp --> ramesh queue

payment --> rabbitmq --> dispatch

dispatch is subscribed to rabbitmq

payment --> they will send a message to MQ application

dispatch --> listening to the queue

money with draw --> queue --> email, sms, whatsapp, monitoring team

withdrawal --> email, sms, whatsapp

synchronous vs asynchronous



running notes of class 10

session 10
7 20

create 3 instances with t3.medium
	for shipping
		mongodb
		mysql
		servers
		
		
do this everytime then you will get confidence to do these things, delete and create

if you know the manual process automation is very easy

select allow all security group

we are following right to left configuration
7:23 all instances created 

creation of records 

you must provide private addresses for all these servers except the frontend server


7:25
mongo db configuration
7:26 redis instance creation
parallel configuration of servers
7:28 mongo db confiugraiton

7:30 mongo db enable configuration
systemctl restart mongod
netstat -lntp


7:31
redis configuration

install redis

7:32 change config  of redis
enable and start

check with netstat -lntp

7:32 
my sql config
installing sql server
enable 

and then start
7:34 set root password


then catalogue user and cart are same configuring them in parallel

7:35
configuration started for 3 servers

7:39
changing mongodb config in catalogue
reload the deamon
enable catalogue , Start Catalogue, 

install mongodb client in catalogue
then load the data

7:40 
user configuration

7:42 
user config file modification

reload the deamon
enable the user
start the user
installing mongodb client

7:44

cart configuration
7:45
modification of configuration redis host and catalogue host in cart configuration


7:46 web configuration

install enable start and remove default content

setup reverse proxy setup and configuration


7:48
what is deployment

when change is needed

dev will update the code

he will push it to some location as zip or archive

dev ops responsibility

download new code and then stop the server

remove old code and replace the new code , after that restart the server then deployment is done

after that in old days downtime is mandatory and 6 and 7 hours for testing and in old process


Devops is only responsible for from downtime to zero downtime , for same reason ops is popular now


8:08 end of quiz

8:15 break

8:16 mysql shipping configuration

maven is build tool for the same

user add create dir and shipping zip download and install depedencies using mvn clean package

8:19
configuration of shipping service


reload the deamon
enable start and install mysql client


8:21 rabbit mq

called messaging queue database

synchronus and asynchronus

If a server is down you wont be able to access it

synchronus means server should be always up and running

asynchronus 

there is always a chance to get the server go offline


we will have a client and server with inbetween a messaging broker between them

client ----> messaging broker ---> server

if server is offline messaging broker will wait for him to come online and then deliver it

there will be  a queue for the server

server is subscribed to message queue
when server is offline it will be added to queue
when server is online it will check queue for messages

8:26

when we make payment it goes to rabbit mq and its conencted with dispatch

dispatch is subscribed to rabbitmq

when dispatchis offline it will wait but when online it will be dispatchs resonsiblity to push payment 

8:28
installation of rabbit mq
8:30 end of rabbit mq
8:30 payment is python application and works on pip
8:31 all the records in hostedzone
installation and deployment of payment module

it will be installed when pip install is used

8:34 configuration of payment service

reload the deamon
enable start payment
netstat -lntp

point this in web
8:35 whole project
and questions









