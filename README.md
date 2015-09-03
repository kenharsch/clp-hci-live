CLP - HCI Fall 2015
===
#### Database is mysql

To start mysql server:

mysql.server start

To start db:

  rake db:create
  
  rake db:migrate
  
  rake db:seed
  

  
#### Server for production is Puma

To run Puma server:

  bundle exec puma -t 3:130 -p 3000
  
Development can be done with rails s
