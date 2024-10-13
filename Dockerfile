FROM python:3.9

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 8080 available to the world outside this container
EXPOSE 9000

# Define environment variable
ENV HD_PORT 9000
ENV HD_PRODUCTION 1
ENV HD_HOST 0.0.0.0
ENV OLLAMA_URL http://192.168.1.20:11434

# Run app.py when the container launches
CMD ["python", "main.py"]