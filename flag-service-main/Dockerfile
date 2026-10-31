# Python Dockerfile for flag-service (optimized, small surface)
# Replaces previous Go Dockerfile — builds a lightweight image that runs the Flask app

FROM python:3.11-slim

# Prevent Python from writing .pyc files and enable stdout/stderr flushing
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install minimal system dependencies (ca-certificates for TLS) and clean up apt lists
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Python runtime dependencies using the project's requirements.txt
COPY requirements.txt /app/
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r /app/requirements.txt

# Copy only application files (keep layers small)
COPY . /app

# Ensure the app uses the PORT env var from the README (default 8002)
ENV PORT=8002
EXPOSE 8002

# Run with gunicorn for production-like process management
# Use a small number of workers suitable for a small service; tune as needed
CMD ["gunicorn", "--bind", "0.0.0.0:8002", "app:app", "--workers", "2", "--threads", "4"]
