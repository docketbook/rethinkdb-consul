# rethinkdb-consul - RethinkDB with automatic registration

## Available Tags

* ```2.3.2```,```latest``` (2.3.2/Dockerfile)

## Description
An Alpine based RethinkDB container that is setup to automatically register with Consul and perform regular health/reachability checks.

## Environment Variables
This image can utilise the following variables

* ```CONSUL_ADDRESS``` sets the address of the Consul instance to register against. This should be in the form of ```hostname:8500``` such as ```discovery.provider.com:8500```. 

## Important Ports

* ```tcp/8080``` Web UI/Administration console
* ```tcp/28015``` Client/Data port
* ```tcp/29015``` Intra-cluster communications

## Data Directories

* ```/data``` Designated as a separate volume in which Redis stores any persistent data
