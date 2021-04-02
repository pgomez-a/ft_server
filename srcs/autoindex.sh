#!bin/bash
if [[ "$INDEX" = "on" ]]
then
	rm -f /etc/nginx/sites-available/default
	rm -f /etc/nginx/sites-enabled/default
	cp /srcs/autoindex_on /etc/nginx/sites-available/default
	ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
elif [[ "$INDEX" =  "off" ]]
then
	rm -f /etc/nginx/sites-available/default
	rm -f /etc/nginx/sites-enabled/default
	cp /srcs/autoindex_off /etc/nginx/sites-available/default
	ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
else
	echo "Unvalid Parameter"
fi
service nginx reload
