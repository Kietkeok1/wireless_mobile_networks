import matplotlib.pyplot as plt
import numpy as np

# chế độ đọc ('r') lưu vào biến 'data'
data = open('packet_graph.txt', 'r')
# khỏi tạo ds, sv gt đọc file
send_count = []
received_count = []
dropped_count = []
# Mỗi dòng đọc được được chia thành các phần bằng dấu cách và sv kq vào biến demo
# Gt đầu tiên trong danhsach 'demo' chuyển số nguyên và thêm vào danh sách send_count
for item in data:
    demo = item.split(' ')
    send_count.append(int(demo[0]))
    received_count.append(int(demo[1]))
    dropped_count.append(int(demo[2][0:-1]))

print(send_count)
print(received_count)
print(dropped_count)

n_groups = 3  # Thiết lập số lượng 3 và tạo đối tượng hình vẽ và trục bằng phương thức ...
fig, ax = plt.subplots()
index = np.arange(n_groups) # Khởi tạo một mảng 'index' với giá trị từ 0 đến n_groups-1.
bar_width = 0.25
opacity = 0.8

rects1 = plt.bar(index, send_count, bar_width, alpha=opacity, color='g', label='Gói Tin Gửi _ Packet Sent')
rects2 = plt.bar(index + bar_width, received_count, bar_width, alpha=opacity, color='b', label='Gói Tin Nhận _ Packet Received')
rects3 = plt.bar(index + bar_width + bar_width, dropped_count, bar_width, alpha=opacity, color='r', label='Gói Tin Rớt _ Packet Dropped')
# hàm plt.bar()
plt.xlabel('Tên Giao Thức')
plt.ylabel('Số Gói Tin')
plt.xticks(index + bar_width, ('DSDV', 'AODV', 'DSR'))
plt.legend()
plt.tight_layout()
plt.show()

data.close()