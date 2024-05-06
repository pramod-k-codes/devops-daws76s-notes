# session-10
[Session 10](https://www.youtube.com/watch?v=XQ15cL16R8Q&list=PL1jY4BuFJn1efO4Sv57kuxMBLt1ThyyUv&index=12)


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









