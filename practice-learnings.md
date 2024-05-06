# practice learnings

## be organized

pktes.shop

catlogue.pktes.shop
user.pktes.shop
cart.pktes.shop
shipping.pktes.shop
payment.pktes.shop
mongo.pktes.shop

location /api/catalogue/ { proxy_pass http://catlogue.pktes.shop:8080/; }
location /api/user/ { proxy_pass http://user.pktes.shop:8080/; }
location /api/cart/ { proxy_pass http://cart.pktes.shop:8080/; }
location /api/shipping/ { proxy_pass http://shipping.pktes.shop:8080/; }
location /api/payment/ { proxy_pass http://payment.pktes.shop:8080/; }


proxy_http_version 1.1;
location /images/ {
  expires 5s;
  root   /usr/share/nginx/html;
  try_files $uri /images/placeholder.jpg;
}
location /api/catalogue/ { proxy_pass http://catlogue.pktes.shop:8080/; }
location /api/user/ { proxy_pass http://user.pktes.shop:8080/; }
location /api/cart/ { proxy_pass http://localhost:8080/; }
location /api/shipping/ { proxy_pass http://localhost:8080/; }
location /api/payment/ { proxy_pass http://localhost:8080/; }

location /health {
  stub_status on;
  access_log off;
}

proxy_http_version 1.1;
location /images/ {
  expires 5s;
  root   /usr/share/nginx/html;
  try_files $uri /images/placeholder.jpg;
}
location /api/catalogue/ { proxy_pass http://catlogue.pktes.shop:8080/; }
location /api/user/ { proxy_pass http://user.pktes.shop:8080/; }
location /api/cart/ { proxy_pass http://cart.pktes.shop:8080/; }
location /api/shipping/ { proxy_pass http://shipping.pktes.shop:8080/; }
location /api/payment/ { proxy_pass http://payment.pktes.shop:8080/; }

location /health {
  stub_status on;
  access_log off;
}



[Unit]
Description = Catalogue Service

[Service]
User=roboshop
Environment=MONGO=true
Environment=MONGO_URL="mongodb://mongo.pktes.shop:27017/catalogue"
ExecStart=/bin/node /app/server.js
SyslogIdentifier=catalogue

[Install]
WantedBy=multi-user.target


mongo --host mongo.pktes.shop </app/schema/catalogue.js>

[Unit]
Description = User Service
[Service]
User=roboshop
Environment=MONGO=true
Environment=REDIS_HOST=<REDIS-SERVER-IP>
Environment=MONGO_URL="mongodb://mongo.pktes.shop:27017/users"
ExecStart=/bin/node /app/server.js
SyslogIdentifier=user

[Install]
WantedBy=multi-user.target


[Unit]
Description = Cart Service
[Service]
User=roboshop
Environment=REDIS_HOST=redis.pktes.shop
Environment=CATALOGUE_HOST=catlogue.pktes.shop
Environment=CATALOGUE_PORT=8080
ExecStart=/bin/node /app/server.js
SyslogIdentifier=cart

[Install]
WantedBy=multi-user.target

[Unit]
Description=Shipping Service

[Service]
User=roboshop
Environment=CART_ENDPOINT=cart.pktes.shop:8080
Environment=DB_HOST=sql.pktes.shop
ExecStart=/bin/java -jar /app/shipping.jar
SyslogIdentifier=shipping

[Install]
WantedBy=multi-user.target



mysql -h sql.pktes.shop -uroot -pRoboShop@1 < /app/schema/shipping.sql 



[Unit]
Description=Payment Service

[Service]
User=root
WorkingDirectory=/app
Environment=CART_HOST=cart.pktes.shop
Environment=CART_PORT=8080
Environment=USER_HOST=user.pktes.shop
Environment=USER_PORT=8080
Environment=AMQP_HOST=rabbit.pktes.shop
Environment=AMQP_USER=roboshop
Environment=AMQP_PASS=roboshop123

ExecStart=/usr/local/bin/uwsgi --ini payment.ini
ExecStop=/bin/kill -9 $MAINPID
SyslogIdentifier=payment

[Install]
WantedBy=multi-user.target


[Unit]
Description = Dispatch Service
[Service]
User=roboshop
Environment=AMQP_HOST=rabbit.pktes.shop
Environment=AMQP_USER=roboshop
Environment=AMQP_PASS=roboshop123
ExecStart=/app/dispatch
SyslogIdentifier=dispatch

[Install]
WantedBy=multi-user.target