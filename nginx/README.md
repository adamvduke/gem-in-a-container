# gem-in-a-container-nginx

A docker container running [nginx](http://nginx.org/) as a reverse proxy for [geminacontainer](../geminabox).

```
docker run -it -d --name geminabox -p 9180:9180 -v /path/to/host/data-dir:/srv/geminabox/data adamvduke/gem-in-a-container
docker run -it --rm --link geminabox -p 5000:5000 --volumes-from geminabox adamvduke/gem-in-a-container-nginx
```
