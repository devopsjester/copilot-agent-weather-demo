FROM python:3.12-slim

# Install basic system dependencies (if needed)
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /workspace

# Copy requirements.txt if it exists and install dependencies
COPY requirements.txt .

RUN if [ -f requirements.txt ]; then \
      pip install --upgrade pip && pip install -r requirements.txt ; \
    fi

# (Optional) Install dev dependencies if dev-requirements.txt exists
COPY dev-requirements.txt .
RUN if [ -f dev-requirements.txt ]; then pip install -r dev-requirements.txt; fi

CMD [ "bash" ]