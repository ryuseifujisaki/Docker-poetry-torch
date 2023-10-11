FROM python:3.11.2

WORKDIR /app
RUN pip install poetry
COPY ./app/ /app
ARG MESSAGE
ENV MESSAGE $MESSAGE

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y libgl1-mesa-dev
RUN apt-get install -y libglib2.0-0 libsm6 libxrender1 libxext6
RUN apt-get install -y ffmpeg
RUN apt-get install -y gcc python3-dev
RUN poetry install
