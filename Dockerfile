# Sử dụng base image nhẹ và ổn định
FROM openjdk:11-jre-slim

# Thông tin tác giả và mô tả image
LABEL maintainer="kienbui2003 <kienbui2003@gmail.com>" \
      version="0.41.17" \
      description="Custom Blynk Server Image - Optimized for Personal Use"

# Copy file server jar vào container
COPY files/server-0.41.17.jar /blynk/server.jar

# Đặt thư mục làm việc mặc định
WORKDIR /blynk

# Mở các port cần thiết (HTTP, HTTPS)
EXPOSE 8080 9443

# Lệnh khởi động mặc định
ENTRYPOINT ["java", "-jar", "server.jar"]

# Tham số mặc định, có thể ghi đè bằng docker-compose hoặc docker run
CMD ["-dataFolder", "/data"]
