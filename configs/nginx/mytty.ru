server {
	listen [::]:80;
	listen 80;
	server_name mytty.ru www.mytty.ru mytyt.ru mytyty.ru;
	return 301 https://mytty.ru$request_uri;
}

server {
        listen [::]:80;
        listen 80;
        server_name r.mytty.ru;
        root /home/www-user/www/repo;

        location / {
                index index.php index.html;
                autoindex on;
                autoindex_localtime on;
        }
}

server {
	listen [::]:80;
	listen 80;
	server_name r.mytyt.ru r.mytyty.ru;
	return 301 http://r.mytty.ru$request_uri;
}

server {
	listen [::]:443 ssl;
	listen 443 ssl;
	server_name mytty.ru www.mytty.ru;

	ssl_certificate /etc/ssl/nginx/mytty.crt;
	ssl_certificate_key /etc/ssl/nginx/mytty.key;

	access_log /var/log/nginx/access.log;
	error_log /var/log/nginx/error.log;

	rewrite ^/r/(.*)$ http://r.mytty.ru/$1 last;
	rewrite ^/repo/(.*)$ http://r.mytty.ru/$1 last;

        location / {
                include proxy_params;
                proxy_pass http://unix:/home/www-user/www/blog/blog.sock;
        }
}
