<<<<<<< HEAD
<<<<<<< HEAD
# Stage 1: Base image for installing dependencies
FROM python:3.13-alpine AS builder
=======
# Use an official Python runtime as a parent image
FROM python:3.9-slim
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
=======
# Stage 1: Base image for installing dependencies
FROM python:3.13-alpine AS builder
>>>>>>> 693547f (Feat(Docker): Implement Multi-Stage Docker Build with Cache Optimization and Dependency Management)

# Set the working directory
WORKDIR /app

<<<<<<< HEAD
<<<<<<< HEAD
# Install necessary build dependencies for Python packages
RUN apk add --no-cache gcc musl-dev libffi-dev

# Copy only the requirements file to leverage Docker layer caching
COPY requirements.txt .

# Upgrade pip to the latest version first
RUN pip install --upgrade pip

# Install the required dependencies in the builder stage
RUN pip install --no-cache-dir -r requirements.txt


# Stage 2: Final image
FROM python:3.13-alpine AS final

# Install bash in the final image
RUN apk add --no-cache bash

# Set the working directory
WORKDIR /app

# Copy the application code from the host to the container
COPY . .

# Copy the installed dependencies from the builder stage to the final image
COPY --from=builder /usr/local/lib/python3.13/site-packages /usr/local/lib/python3.13/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin
=======
# Copy the current directory contents into the container at /app
COPY . /app
=======
# Install necessary build dependencies for Python packages
RUN apk add --no-cache gcc musl-dev libffi-dev
>>>>>>> 693547f (Feat(Docker): Implement Multi-Stage Docker Build with Cache Optimization and Dependency Management)

# Copy only the requirements file to leverage Docker layer caching
COPY requirements.txt .

# Upgrade pip to the latest version first
RUN pip install --upgrade pip

# Install the required dependencies in the builder stage
RUN pip install --no-cache-dir -r requirements.txt
<<<<<<< HEAD
# RUN pip install --root-user-action=ignore -r requirements.txt"
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
=======


# Stage 2: Final image
FROM python:3.13-alpine AS final

# Install bash in the final image
RUN apk add --no-cache bash

# Set the working directory
WORKDIR /app

# Copy the application code from the host to the container
COPY . .

# Copy the installed dependencies from the builder stage to the final image
COPY --from=builder /usr/local/lib/python3.13/site-packages /usr/local/lib/python3.13/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin
>>>>>>> 693547f (Feat(Docker): Implement Multi-Stage Docker Build with Cache Optimization and Dependency Management)

# Expose port 8000 for the app to run on
EXPOSE 8000

# Command to run the Flask app using Gunicorn
CMD ["bash", "startup.txt"]
