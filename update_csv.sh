#!/bin/bash

LAST_ID=$(tail -n 1 data.csv | cut -d',' -f1)

if [ "$LAST_ID" = "id" ]; then
    LAST_ID=0
fi

NEW_ID=$((LAST_ID + 1))

echo "$NEW_ID,User$NEW_ID,$(date +%F)" >> data.csv
