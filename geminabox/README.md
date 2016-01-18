# gem-in-a-container

A docker container running [geminabox](https://github.com/geminabox/geminabox).

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

## Building the container

```
docker build -t adamvduke/gem-in-a-container github.com/adamvduke/gem-in-a-container
```
