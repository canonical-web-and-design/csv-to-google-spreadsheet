FROM ubuntu:focal

# Install required system packages for our CronJob
RUN apt-get update && apt-get install --yes --no-install-recommends python3-pip

COPY requirements.txt .
COPY importer.py .

RUN pip3 install --no-cache-dir -r requirements.txt

ENTRYPOINT python3 importer.py
