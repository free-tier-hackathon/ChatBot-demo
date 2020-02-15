#!/usr/bin/env bash

NLTK_DATA="/var/www/nltk_data"
export $NLTK_DATA

if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ] ; then
    (python manage.py createsuperuser --no-input)
fi

(gunicorn example_app.wsgi --user www-data --bind 0.0.0.0:8000 --workers 1) &
nginx -g "daemon off;"
