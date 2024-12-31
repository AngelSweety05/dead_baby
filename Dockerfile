FROM python:3.8-slim-buster

# Update and install necessary packages
RUN apt update && apt upgrade -y && apt install -y \
    ffmpeg \
    git \
    python3-pip \
    && apt clean

# Copy requirements file and install Python dependencies
COPY requirements.txt /requirements.txt
RUN pip3 install --no-cache-dir -U pip && pip3 install --no-cache-dir -r /requirements.txt

# Create and set the working directory
RUN mkdir /LazyPrincess
WORKDIR /LazyPrincess

# Command to run the bot
CMD ["python3", "bot.py"]
