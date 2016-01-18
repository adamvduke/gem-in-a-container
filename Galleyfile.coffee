module.exports =
  CONFIG:
    registry: 'docker.io'

  'gem-in-a-container':
    stateful: true
    image: 'adamvduke/gem-in-a-container'
    ports: ['9180:9180']

  'gem-in-a-container-nginx':
    image: 'adamvduke/gem-in-a-container-nginx'
    ports: ['5000:5000']
    links: ['gem-in-a-container:gem-in-a-container']
    volumesFrom: ['gem-in-a-container']
