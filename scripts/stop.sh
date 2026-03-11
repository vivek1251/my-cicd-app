#!/bin/bash
pkill -f 'node src/index.js' || true
echo App stopped.