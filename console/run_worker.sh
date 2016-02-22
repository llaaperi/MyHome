#!/bin/sh

../env/bin/celery -A console.celery worker -B --loglevel=info
