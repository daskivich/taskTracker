#!/bin/bash

export PORT=5102

cd ~/www/taskTracker
./bin/taskTracker stop || true
./bin/taskTracker start


