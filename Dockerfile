FROM debian:stable-slim

# Install Python and tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-venv python3-pip build-essential git curl \
    && rm -rf /var/lib/apt/lists/*

# Reinstall pip cleanly
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3

# Upgrade pip, setuptools, wheel
RUN python3 -m pip install --no-cache-dir --upgrade pip setuptools wheel

# Copy project files
WORKDIR /app
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Start app
CMD ["python3", "-m", "VideoxD"]
