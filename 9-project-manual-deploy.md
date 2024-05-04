[session -09 ](https://www.youtube.com/watch?v=RaMvxl7mygY)
# session-09

## configuration of all servers

### 1:23 possibility of errors
### 3:14 instance creation 5 t2.micro 1t3.medium
### ![t2.micro servers](image/9-t2.micro-servers.png)

### servers required 
![servers required screen](image/9-all-servers-config.png)
### 5:40 Configuration of the servers


use private ip of instances to connect to them in hosted zone

always need public access for front end 
always check after running server   
 - if the service is running and ports are open or not using `netstat -lntp`

**09:50** configuring catalogue

disable default version and enable nodejs version 18

### 13:17 loading products into db
    you can load products into db from either from same server or from different server by connecting to the database

**14:10** loading and restarting products

restart after loading products into db

 **15:00** check logs by using `tail or less` and check if mongo db is connected 

checking logs

 ![checking logs](image/9-checking-logs.png)

15:31 configure web and configuration completed at 18:10

### 18:10 cart user redis config 

user and cart dependent on redis

### 18:40 redis config

bind redis to interent

![alt text](image/9-redis-config.png)


check if the server is running properly using `netstat -lntp`

**25:00** configure user
28:47


     

  