# Here we chose the exact python version we have in our computer, together with the slim buster tag, which will install a light linux version in our container
FROM python:3.8.10-slim-buster
# Here we named our work directory, so we separate our files from the rest of the linux files
WORKDIR /djangodockertest
# What we are doing here is copying the requirements file of this folder into the container, and naming it the same name
COPY requirements.txt requirements.txt
# Here we are using the requirements file as a way of installing all our dependencies in our container
RUN pip install -r requirements.txt
# When we are working with linux, "." means "here"
# In this command we are copying everything on "here" (the directory of the Dockerfile) to "here" (the workdir in our container)
# It seems confusing because both mean "here", but point to different things
COPY . .
# Then, we create the final comand using CMD
# First we run the server normally, but we won't be able to reach it if we don't expose the port
# For reasons i don't fully understand, putting the network address as 0.0.0.0 makes the server available for the main machine
# after that, we match the server to the 8000 port, which we will access later when we run this image
CMD ["python3","manage.py","runserver", "0.0.0.0:8000"]