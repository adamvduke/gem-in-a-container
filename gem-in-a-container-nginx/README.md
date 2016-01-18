# gem-in-a-container-nginx

A docker container running [nginx](http://nginx.org/) as a reverse proxy for [adamvduke/gem-in-a-container](../gem-in-a-container).

```
docker run -it -d --name gem-in-a-container -p 9180:9180 -v /path/to/host/data-dir:/srv/geminabox/data adamvduke/gem-in-a-container
docker run -it --rm --link gem-in-a-container -p 5000:5000 --volumes-from gem-in-a-container adamvduke/gem-in-a-container-nginx
```
