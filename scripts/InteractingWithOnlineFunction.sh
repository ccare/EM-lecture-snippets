#!/bin/sh
# create a new dependency world
curl -X PUT http://localhost:8080/services/spaces/space2 -d ""
# Define: a is b + c
curl -X PUT http://localhost:8080/services/spaces/space2/myFun -d "function() { return 'hi' }"
# Read observable a
curl http://localhost:8080/services/spaces/myspace/a -w "\n"
# define b and c
curl -X PUT http://localhost:8080/services/spaces/myspace/b -d "1"
curl -X PUT http://localhost:8080/services/spaces/myspace/c -d "2"
# Read observable a
curl http://localhost:8080/services/spaces/myspace/a -w "\n"
# update b
curl -X PUT http://localhost:8080/services/spaces/myspace/b -d "'a string '"
# Read observable a
curl http://localhost:8080/services/spaces/myspace/a -w "\n"
# terminate my app
curl -X DELETE http://localhost:8080/services/spaces/myspace -d ""
# santity check that the state really has gone
# read observable a
curl http://localhost:8080/services/spaces/myspace/a -w "\n"

