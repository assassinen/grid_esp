FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server sudo \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /run/sshd

RUN useradd -m -s /bin/bash -u 1000 nii && \
    echo "nii:1" | chpasswd && \
    echo "nii ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY . .

CMD /usr/sbin/sshd && \
    uvicorn src.main:app --host 0.0.0.0 --port 80 --reload

