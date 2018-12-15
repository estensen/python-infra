FROM python:3.6.7-slim

WORKDIR /app
COPY . /app

RUN pip install pipenv
RUN pipenv install --system

EXPOSE 5000
CMD ["python", "app.py"]
