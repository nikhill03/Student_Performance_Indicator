FROM python:3.10-slim

WORKDIR /application

COPY . /application/

RUN apt-get update -y && apt install awscli -y

RUN pip install -r requirements.txt

CMD ["python3", "application.py"]