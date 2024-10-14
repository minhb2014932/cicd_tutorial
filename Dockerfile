FROM ubuntu:latest

MAINTAINER Tuan Thai "tuanthai@example.com"

# Cập nhật và cài đặt các gói cần thiết
RUN apt update -y && \
    apt install -y python3-pip python3-dev build-essential python3-venv && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Sao chép mã nguồn vào container
ADD . /flask_app

# Đặt thư mục làm việc
WORKDIR /flask_app

# Tạo môi trường ảo
RUN python3 -m venv venv

# Kích hoạt môi trường ảo và cài đặt các gói Python
RUN ./venv/bin/pip install --no-cache-dir -r requirements.txt

# Thiết lập điểm vào
ENTRYPOINT ["./venv/bin/python"]
CMD ["flask_docker.py"]

