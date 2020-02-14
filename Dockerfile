# Dockerfile

FROM python:3.6

# install nginx
RUN apt-get update && apt-get install vim -y --no-install-recommends

# copy source and install dependencies
RUN mkdir -p /opt/app
RUN mkdir -p /opt/app/example_app
COPY requirements.txt run-server.sh /opt/app/
COPY example_app /opt/app/example_app
WORKDIR /opt/app
RUN pip install -r requirements.txt
RUN chown -R www-data:www-data /opt/app

# start server
EXPOSE 8080
STOPSIGNAL SIGTERM
CMD ["/opt/app/run-server.sh"]
