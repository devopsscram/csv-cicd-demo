#!/bin/bash

set -e

TARGET_DIR=/tmp/csv-demo

mkdir -p $TARGET_DIR

cp data/employees.csv $TARGET_DIR/

echo "CSV deployed successfully"
cat $TARGET_DIR/employees.csv

chmod +x scripts/deploy.sh
