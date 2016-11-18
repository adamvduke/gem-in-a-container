Docker descriptions for running [geminabox](https://github.com/geminabox/geminabox).

The [gem-in-a-container](https://hub.docker.com/r/adamvduke/gem-in-a-container) image runs the rack application, and the [gem-in-a-container-nginx](https://hub.docker.com/r/adamvduke/gem-in-a-container-nginx) image provides a reverse proxy that can but put in front of the rack app to achieve some caching.

## Quick start

### Running with [Galley](https://github.com/twitter-fabric/galley)

```
$ npm install -g galley-cli
$ git clone https://github.com/adamvduke/gem-in-a-container.git
$ cd gem-in-a-container
$ galley run gem-in-a-container-nginx.dev
```

### Running with [Docker Compose](https://docs.docker.com/compose)

1. Install [Compose](https://docs.docker.com/compose/install)
2. `docker-compose up`

## Usage

The fastest way to get started is to run the container straight from docker hub:

```
docker run -it --rm -p 9180:9180 adamvduke/gem-in-a-container
```

## Configuration options

### Data directory options

Gems are downloaded to a volume in the container at `/srv/geminabox/data`. You can map the volume to your docker host to preserve downloaded gems between runs.

```
docker run -it --rm -p 9180:9180 -v /path/to/host/data-dir:/srv/geminabox/data adamvduke/gem-in-a-container
```

The path `/srv/geminabox/data` can also be overridden with the environment variable `DATA_DIR`.

```
docker run -it --rm -p 9180:9180 -e DATA_DIR=/srv/data -v /path/to/host/data-dir:/srv/data adamvduke/gem-in-a-container
```

### Application server options

The default ruby application server is puma, but can be overridden with the environment variable `APP_SERVER`. Available options supported by the entrypoint are: passenger, puma, thin, and unicorn.

```
docker run -it --rm -p 9180:9180 -e APP_SERVER=unicorn adamvduke/gem-in-a-container
```

### Geminabox options

[Geminabox](https://github.com/geminabox/geminabox) supports several configuration options which can be set through environment variables.

Setting `RUBY_GEMS_PROXY` to a value other than `true` will cause geminabox to not fetch missing gems from [rubygems.org](rubygems.org).

```
docker run -it --rm -p 9180:9180 -e RUBY_GEMS_PROXY=false adamvduke/gem-in-a-container
```

Setting `ALLOW_REMOTE_FAILURE` to a value other than `true` will cause geminabox to raise errors if rubygems is not available.

```
docker run -it --rm -p 9180:9180 -e ALLOW_REMOTE_FAILURE=false adamvduke/gem-in-a-container
```

Setting `BUILD_LEGACY` to a value other than `false` will cause geminabox to build legacy rubygems indexes for old versions of rubygems.

```
docker run -it --rm -p 9180:9180 -e BUILD_LEGACY=true adamvduke/gem-in-a-container
```

### Using gem-in-a-container-nginx as a reverse proxy

```
docker run -it -d --name gem-in-a-container -p 9180:9180 -v /path/to/host/data-dir:/srv/geminabox/data adamvduke/gem-in-a-container
docker run -it --rm --link gem-in-a-container -p 5000:5000 --volumes-from gem-in-a-container adamvduke/gem-in-a-container-nginx
```

## Building the images yourself

### gem-in-a-container

Build the image based on what's in the repo on github.

```
docker build -t adamvduke/gem-in-a-container github.com/adamvduke/gem-in-a-container
```

Build the image based on a local clone of the repo

```
docker build -t adamvduke/gem-in-a-container .
```

### gem-in-a-container-nginx


Build the image based on what's in the repo on github.

```
docker build -t adamvduke/gem-in-a-container-nginx github.com/adamvduke/gem-in-a-container -f Dockerfile.nginx
```

Build the image based on a local clone of the repo

```
docker build -t adamvduke/gem-in-a-container-nginx -f Dockerfile.nginx .
```
