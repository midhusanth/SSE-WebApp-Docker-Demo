# Base image
FROM python:3.11-slim

# Set work directory
WORKDIR /app

# Copy files
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Expose port 80
EXPOSE 80

# Run the app
CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:app"]
