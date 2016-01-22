# gem-in-a-container

Docker descriptions for running [geminabox](https://github.com/geminabox/geminabox).

The [adamvduke/gem-in-a-container](gem-in-a-container) image runs the rack application, and the [adamvduke/gem-in-a-container-nginx](gem-in-a-container-nginx) image provides a reverse proxy that can but put in front of the rack app to acheive some caching.

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
