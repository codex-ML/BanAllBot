FROM python:3.10-slim

# Install necessary packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create application directory
WORKDIR /app/

# Copy application files
COPY . /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set the command to run the application
CMD ["python", "ban.py"]
