FROM debian:stable-slim

# Install Python and tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-pip python3-venv build-essential git curl \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip, setuptools, wheel safely
RUN python3 -m pip install --no-cache-dir --upgrade pip setuptools wheel

# Copy project files
WORKDIR /app
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Start app
CMD ["python3", "-m", "VideoxD"]
