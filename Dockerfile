FROM python:3.11-slim

# Install system dependencies (for some Python packages)
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg git curl build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt
# Install tgcalls first
RUN pip install --no-cache-dir tgcalls==3.0.0.dev6

# Then install requirements but ignore deps
RUN pip install --no-cache-dir --no-deps pytgcalls==3.0.0.dev19

# Start the bot
CMD ["python3", "-m", "VideoxD"]
