# docker-gremlin-neo4j

_A work in progress. Use at your own discretion._

An unofficial set of lightweight Docker, and Docker Compose files for working with Apache TinkerPop™ Gremlin Console, Gremlin Server, and Neo4j.

`org.apache.tinkerpop neo4j-gremlin` is installed out-of-the-box for both the console, and the server image (currently version `3.2.1`).


## Disclaimer

By default, most Gremlin Server configuration files will set the host binding to `localhost`. The Gremlin Server image in this repository uses a custom configuration file ([`gremlin-server-custom.yml`](gremlin-server-neo4j/conf/gremlin-server-custom.yml)) in order to bind to `0.0.0.0`. i.e. any 'host' can connect to it.


## TODO

- [ ] Improve configuration
- [ ] Make the Gremlin Server image useful


## Usage

**Gremlin Console with Neo4j standalone:**

```bash
docker-compose run --rm --service-ports gremlin-console-with-neo4j
```

**Neo4j only:**

```bash
docker-compose run --rm --service-ports neo4j-server
```


## Development

**Build Docker images:**

See the respective files below for more information.

```bash
./bin/build-gremlin-console-neo4j.sh
./bin/build-gremlin-server-neo4j.sh
```


## Useful Console Commands

**Connect to remote Docker Compose service:**

The following command assumes that the console container, and the server container are linked. It should not be a problem if launched with the `gremlin-console-all` service.

    :remote connect tinkerpop.server conf/remote-docker-compose.yml
    :remote console

**Load Neo4j graph:**

The following command assumes that the `/data/` directory already contains Neo4j data, and that it has already been mounted between the host, and the console container.

    Neo4jGraph.open("/data/")

DO NOT link it to `/data/databases/graph.db` as it is not a valid path.
