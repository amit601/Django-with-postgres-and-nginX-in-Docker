#!/bin/bash

##this script is to django at the starting of container
echo ""
echo "starting Django....."
echo ""
gunicorn --chdir hello --bind :8000 hello_django.wsgi:application
##python hello/manage.py runserver
echo ""
echo "Django started"

