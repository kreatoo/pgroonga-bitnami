# pgroonga-bitnami

Bitnami PostgreSQL Docker image, with PGroonga included.

For additional documentation, [see bitnami/postgresql docker image](https://hub.docker.com/r/bitnami/postgresql/).

## Usage

Pull your desired image with `docker pull ghcr.io/kreatoo/pgroonga-bitnami:main-VERSION`, replacing VERSION with the version you want.

To use PGroonga, you need to run this SQL query;

`CREATE EXTENSION pgroonga;`

It should work as normal after that.
