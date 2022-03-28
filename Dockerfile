FROM python:3.8-slim
  
RUN apt-get update && apt-get install

RUN apt-get install -y \
  dos2unix \
  libpq-dev \
  libmariadb-dev-compat \
  libmariadb-dev \
  gcc \
  && apt-get clean

RUN python -m pip install --upgrade pip

WORKDIR /my-app/

COPY requirements.txt .

RUN python -m pip install -r requirements.txt

CMD jupyter lab --allow-root