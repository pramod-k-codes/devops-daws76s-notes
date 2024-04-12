# Important

----
Create an aws account
AWS Account
<https://portal.aws.amazon.com/billing/signup>

#### How to create AWS account

<https://www.youtube.com/watch?v=F4jF88UkxV4>

1. CC/DB --> give details like
firstname
lastname
address
email

## 5:05 types of computers

Computer --> computation with in local or wide network
-----------

### following all can be called as computers

- Laptop ,  
- Desktop  
- Server  
- Mobile  
- TV --> smart tv  
- android  
- wifi/network  
- storage  
- RAM --> 2GB  
- Refrigirator --> they can order food items on their own
- Washing machine
- AC
computers have,**OS,CPU,Ram,Storage,IP Address**

**for example if we take mobile it will have**
OS --> Android
RAM --> 8GB
Storage --> 128/512
CPU --> Snapdragon
WiFi/Mobile net upon connection gives us an Ip address

server --> install application and serve users/clients

## client server thinking

### client server architecture  

![client server architecture](images/1-client-Server-Arch.png)  

The ones who provides response is server, server serves the needs for any request, Clients changes and more in count than servers, Servers are few in than clients  

server --> mobile  
client --> laptop
mobile --> files/images

17:13 IT --> communication between clients and server
----------------------------------------------

Operating Systems --> Linux  
Windows --> bridge b/w user and hardware --> UI  
windows --> user instructions --> commands --> 0/1 --> hardware  
OS will take care of how to convert instructions into 0/1  

21:18 Windows vs Linux
----------------

graphics --> load increase on RAM, CPU  
servers world --> linux  
linux is Fast, less cost and is free  
stability --> run 10 years also non stop  
performance --> very high  
security --> comes from unix principles  

How to connect linux server
----------------------------

box
lock --> public (anyone can see )   
key --> private (you wont share it with anyone , private to you)   

Auth mechanism
--------------------

1. what you know --> username/password
2. what you have --> tokens
3. what you are --> fingerprints, palms, retina, etc.

what you have

ssh --> secured shell

pub/private key --> generate this pair  
[public private keys asymmetric and symmetric cryptography](https://chat.openai.com/share/dab11997-13c5-48db-b11a-1272f7641909)

 a private key can be used for encryption, but it's not commonly done in the context of public-key cryptography. Private keys are usually kept secret and used for decryption, while public keys are used for encryption. However, in symmetric-key cryptography, where the same key is used for both encryption and decryption, the same key can be used for both purposes.

Linux server = node = box

```bash
ssh-keygen -f <file-name>
```

31:15 Git download and configuration
------------------------------------

Git bash --> <https://git-scm.com/downloads>
git bash is a mini linux in windows

```bash
/c/Users/user
/c/Users/sivakumar

ssh-keygen -f daws-76s
daws-76s.pub --> public key
daws-76s --> private key
```

38:26 public key structure or syntax
------------------------------------

```bash

ssh-rsa <code> <laptop-name>
```

cheapest region --> us-east-1 >> somewhat slow than mumbai --> negligible delay

AZ
--

every region --> min 2 AZ for High Availability

41:58 AWS - creation of Security group and
---------

 --> everything is called as resource  
 EC2 --> creation of servers  
 0.0.0.0/0 --> representation of internet / public  
 Linux is not operating system -> it is kernel

50:10 OS vs Kernel
------------------

Kernel --> connecting to Hardware --> no utilities, no shell

[Linus Torvalds](https://en.wikipedia.org/wiki/Linus_Torvalds)
 created Linux kernel
 Do watch [The mind behind linux](https://www.youtube.com/watch?v=o8NPllzkFhE)

 ![linux head quarters](images/1-linuxHeadquarters.png)
Unix --> very costly, tightly coupled to hardware
Laptop --> IBM Dos
Linux Kernel --> based on unix principles but code is from the scratch --> C Language

Open source
-----------

Kernel + packages + shell == OS
Android is flavour of linux
Kernel + package + shell + UI

ubuntu
-------

Desktop --> Kernel + Shell + UI
Server --> Kernel + Shell
centos
RHEL
Fedore
Suse
Arch Linux
99% same --> few commands only will differ

RHEL --> Open source --> but not free
Code open source -> take the code

Support --> immediate call
community
RHEL = Centos = Fedora = almalinux = AWS Linux

RHEL --> Code --> OS --> CentOS --> internet community

## connecting to server

IP=54.226.152.150
AWS linux username = ec2-user
private-key

```bash
ssh -i <path-to-private-key> username@IP

ssh -i daws-76s.pem ec2-user@54.226.152.150
```

GitBash/putty --> SSH client
EC2 Server --> SSH server
protocol = SSH
port=22

<https://www.facebook.com:443>

PROTOCOL IP Address Port-no

username and password

absolute path / relative path

/c/Users/user/daws-76s.pem --> absolute

Differentiating between normal user and root user
-----------------------------------------------
```bash
$ --> normal user
# --> root
pwd --> /home/ec2-user
uname --> kernel name

<command-name> <options> <inputs>
options and inputs are ocassionally optional

<command-name> --help = will get info
history - to get commands list used before
```

1 server --> free 30/31 days
2 servers --> 15 days
3 servers --> 10 days

AWS account
public key and private key
create ec2 server and connect to it
client-server
git bash

ec2 t2-micro charges --> assignment --> INR
t3.medium charges --> assignment

#### DevOps overview sessions
Listen to
[Devops overview sessions](https://www.youtube.com/watch?v=iO8qpPeiph0&list=PLbeIORXauosjypPNHf4YGeEKN3KlSjzOj)
