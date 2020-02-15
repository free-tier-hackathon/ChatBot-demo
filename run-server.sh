#!/usr/bin/env bash

export NLTK_DATA="/var/www/nltk_data"

if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ] ; then
    (python manage.py createsuperuser --no-input)
fi

python manage.py migrate --run-syncdb
python train.py

(gunicorn example_app.wsgi --user www-data --bind 0.0.0.0:8000 --workers 1) &
nginx -g "daemon off;"
