# Blynk-Local-Server
Version 0.41.17

Blynk Server là một máy chủ mã nguồn mở được sử dụng làm nền tảng backend cho các dự án IoT.
Server này hoạt động với ứng dụng Android và iOS, cung cấp giao diện đơn giản nhưng mạnh mẽ để kết nối và điều khiển các thiết bị như ESP8266, ESP32, Raspberry Pi và Arduino qua internet.

🎯 Mục tiêu của dự án:
Cung cấp cách cài đặt Blynk Server dễ dàng trên máy chủ hoặc phần cứng của bạn.

docker-compose.yml: Cấu hình Docker Compose với đầy đủ volumes cần thiết.

server.properties: Chứa tất cả các tùy chọn cấu hình có thể chỉnh sửa, nhưng bạn chỉ cần thay đổi 4 giá trị cơ bản để chạy server bảo mật trên thiết bị của mình.

📦 Docker image có sẵn trên Docker Hub: kienbui2oo3/blynk-server:latest
Lưu ý: Hiện tại chỉ hỗ trợ hệ thống x86, với Raspberry Pi thì phải build lại image.

⚙️ Yêu Cầu Hệ Thống
Máy chủ của bạn cần cài đặt sẵn Docker và Docker Compose (khuyến nghị).

Bạn nên làm theo hướng dẫn chính thức để cài đặt:
Cài đặt Docker
Cài đặt Docker Compose

🚀 Quy Trình Khuyến Nghị: Chạy Bằng Docker Compose
SSH vào máy chủ và đảm bảo rằng đã cài đặt docker và docker-compose.

Clone repo về máy chủ:
git clone https://github.com/hortio/docker-blynk.git

Di chuyển vào thư mục dự án:
cd docker-blynk
Cấu hình trong file server.properties.

Trường hợp đơn giản nhất, bạn chỉ cần thay đổi các giá trị:
server.host

contact.email

admin.email

admin.pass

Chạy lệnh:
docker-compose up -d
Hoàn tất! Server sẽ được tự động cập nhật lên phiên bản mới nhất.

💡 Nếu bạn không muốn sử dụng chứng chỉ SSL được tạo tự động bởi Let's Encrypt, hoặc bạn đang dùng reverse proxy (như Nginx hoặc Traefik) trên cổng 80, hãy xóa dòng - "80:8080" trong phần ports của docker-compose.yml và cấu hình reverse proxy chuyển tiếp cổng 80 về 8080.

⚡ Chạy Không Cần Docker Compose
Clone repo về máy chủ:
git clone https://github.com/hortio/docker-blynk.git

Di chuyển vào thư mục:
cd docker-blynk
Cấu hình file server.properties như hướng dẫn ở trên.

Chạy Blynk Server bằng lệnh:
docker run -d \
 -p 8080:8080 -p 80:8080 -p 9443:9443 \
 -v `pwd`/server.properties:/blynk/server.properties \
 -v `pwd`/mail.properties:/blynk/mail.properties \
 -v `pwd`/data:/data \
 -v `pwd`/logs:/blynk/logs \
 hortio/blynk:latest \
 -dataFolder /data -serverConfig /blynk/server.properties
Hoàn tất!

Dữ liệu server sẽ được lưu trong thư mục data.

Log server nằm trong thư mục logs.

💡 Nếu bạn không muốn sử dụng Let's Encrypt hoặc đã có reverse proxy trên cổng 80, chỉ cần loại bỏ -p 80:8080 khỏi lệnh docker run.

❓ Thắc Mắc, Báo Lỗi và Đóng Góp
Nếu bạn có câu hỏi, phát hiện lỗi hoặc muốn đóng góp cho dự án, hãy thoải mái mở issue hoặc tạo pull request trên GitHub!
