FROM python:3.6.7-slim

# Don't write .pyc files
ENV PYTHONDONTWRITEBYTECODE 1
# Get log msgs ASAP instead of waiting for buffering
ENV PYTHONUNBUFFERED 1

RUN pip install pipenv

WORKDIR /app
COPY Pipfile Pipfile.lock ./
RUN pipenv install --system

COPY . /app

EXPOSE 5000
CMD ["python", "app.py"]
