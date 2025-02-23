# start from base
FROM ubuntu:18.04
RUN apt-get update -y &&  apt-get install -y python-pip python-dev
# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
COPY . /app
EXPOSE 8000
CMD [ "gunicorn", "-b", "0.0.0.0:8000", "app:app" ]
