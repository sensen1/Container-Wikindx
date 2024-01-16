---
lang: EN_US
---

# WIKINDX Container Image

This repository holds the source code for two container images to run the 
[WIKINDX](https://wikindx.sourceforge.io/) bibliographic management system.

## Description

To run WIKINDX this repository devides the application into two containers.
This is done to provide maximum performance and maximum security.

### wikindx:fpm-latest

This container image executes all php scripts of the application using
the php-fpm server. 

PHP-FPM is listening on port 9000 within the container.

### wikindx:nginx-latest

This container image provides static HTML pages of the application and 
uses a reverse proxy definition to request the output of the php scripts
from the container running wikindy:fpm-latest.

Nginx is listening on port 8080 within the container. 

**At the moment no SSL/TLS support is provided within the container therefore
you have to put something in front of this container to use SSL/TLS.**

## Prerequisities

A container runtime like

* docker 
* podman
* kubernetes


## Container Parameters

### wikindx:fpm-latest

Keep in mind, that WIKINDX only supports mysql or mariadb.

* `WIKINDX_DB_HOST` - the host and port of the WIKINDX database server (e.g. localhost:3306)
* `WIKINDX_DB` - the name of the dabase of the WIKINDX database
* `WIKINDX_DB_USER` - the username to connect to the database server
* `WIKINDX_DB_PASSWORD` - the password to connect to the database server 

### wikindx:nginx-latest

* `WIKINDX_FPM_URL` - the url to the PHP FPM server (e.g. localhost:9000)

## Volumes

At the moment no volumes can be mounted inside the containers.

## Source Repository

* https://gitea.federationhq.de/Container/wikindx.git

## Usage Examples

Under `examples` you can find examples on how to run this container images. 

## Authors

* **Dominik Meyer** - *Initial work* 

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
