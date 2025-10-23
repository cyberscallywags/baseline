# Use a lightweight Python base image
FROM ghcr.io/astral-sh/uv:python3.12-bookworm

# Set work directory
WORKDIR /app

# Copy dependency files first for caching
COPY pyproject.toml uv.lock* ./

# Install dependencies
RUN uv sync --frozen

# Copy app source
COPY app ./app

# Expose FastAPI port
EXPOSE 8000

# Run with uvicorn
CMD ["uv", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
