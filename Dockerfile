# Dockerfile (optional)
# Purpose: Containerize the app for reproducible runs. Fill in as you add deps.

FROM python:3.11-slim AS base
WORKDIR /app

# Copy only metadata first for efficient layer caching
COPY pyproject.toml requirements.txt ./

# Install system deps if needed (uncomment as required)
# RUN apt-get update && apt-get install -y ffmpeg libsndfile1 && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -U pip \
    && if [ -s requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

# Copy source
COPY src ./src
COPY README.md .

# Default command (override in docker run)
CMD ["python", "-c", "print('vex-ai container placeholder')"]

