FROM python:3.7.3-alpine AS base

WORKDIR /app
RUN pip install pipenv

COPY Pipfile /app/
COPY Pipfile.lock /app/
RUN pipenv install --system --deploy --ignore-pipfile


FROM base AS production
COPY . /app

EXPOSE 5000
CMD ["python", "app.py"]

