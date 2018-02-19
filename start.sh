#!/bin/bash

export PORT=5101

cd ~/www/taskTracker
./bin/taskTracker stop || true
./bin/taskTracker start


