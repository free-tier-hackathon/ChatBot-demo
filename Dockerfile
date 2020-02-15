# Dockerfile

FROM python:3.6

# install nginx
RUN apt-get update && apt-get install nginx vim -y --no-install-recommends
COPY nginx.default /etc/nginx/sites-available/default

# redirect logs to output
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# nginx needs permissions here
RUN chown -R www-data:www-data /var/lib/nginx

# copy source and install dependencies
RUN mkdir -p /opt/app
RUN mkdir -p /opt/app/example_app
RUN mkdir -p /var/www/nltk_data
RUN chown -R www-data:www-data /var/www/nltk_data

COPY example_app /opt/app/example_app
COPY requirements.txt run-server.sh /opt/app/
RUN chmod a+x /opt/app/run-server.sh

WORKDIR /opt/app
RUN pip install -r requirements.txt
RUN chown -R www-data:www-data /opt/app

# start server
EXPOSE 8080
STOPSIGNAL SIGTERM
USER www-data
CMD ["/opt/app/run-server.sh"]
