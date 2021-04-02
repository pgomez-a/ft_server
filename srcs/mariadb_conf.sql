CREATE DATABASE wordpress;
CREATE USER pgomeza@localhost IDENTIFIED BY 'xxxx';
GRANT ALL PRIVILEGES ON wordpress.* TO pgomeza@localhost;
FLUSH PRIVILEGES;
exit
