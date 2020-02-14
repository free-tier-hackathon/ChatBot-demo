#!/usr/bin/env bash
# start-server.sh
if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ] ; then
    (cd example_app; python manage.py createsuperuser --no-input)
fi
(cd example_app; gunicorn example_app.wsgi --user www-data --bind 0.0.0.0:8080 --workers 1) &
