# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# RUN apt-get update && upgrade
# RUN python -m pip install --upgrade pip

# Install the required dependencies
RUN pip install --no-cache-dir -r requirements.txt
# RUN pip install --root-user-action=ignore -r requirements.txt"

# Expose port 8000 for the app to run on
EXPOSE 8000

# Command to run the Flask app using Gunicorn
CMD ["bash", "startup.txt"]
