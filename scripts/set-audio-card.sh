#!/bin/bash

asoundconf list

echo "Setting default sound card to $1"
asoundconf set-default-card $1
