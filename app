server {
    listen    80;

    location / {
        root /home/boxes/hosted;
    }

    location / {
        index index.html;
        root /home/vagrant/proj/app/static/;
    }

    location / {
        content_by_lua_file /home/vagrant/proj/app/handler.lua;
    }
}
