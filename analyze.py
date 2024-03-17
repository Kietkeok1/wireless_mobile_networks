from pprint import pprint as pp
import sys

file_name=sys.argv[1] # truy xuất tên tệp từ các đối số dòng lệnh và gán
data_trace = open(file_name,'r')
graph_data = open('packet_graph.txt','a+')
energy_data = open('energy_graph.txt','a+')
send_count = 0
received_count = 0
list_trace = []
line_count = 0
dropped_count = 0

#  khi đọc all các dòng trong tệp dữ liệu
for line in data_trace:
	list_trace.append(line)
	line_count += 1
# xử lý từng dòng trong list_trace. Dòng được tách thành một danh sách các từ bằng split
for i in range(line_count):
	if((list_trace[i].split(' '))[0] == 's'):
		send_count += 1
	elif((list_trace[i].split(' '))[0] == 'r'):
		received_count += 1
	elif((list_trace[i].split(' '))[0] == 'D'):
		dropped_count += 1
	else:
		pass

# in ra số lượng gói tin đã gửi_gói tin đã nhận_gói tin đã bị thả_thời gian mô phỏng
pp('Gói Tin Gửi - Number of packets sent: {}'.format(send_count))
pp('Gói Tin Nhận - Number of packet received: {}'.format(received_count))
pp('Gói Tin Rớt - Number of packet dropped: {}'.format(dropped_count))
pp('Thời gian mô phỏng - Simulation time: {} ms'.format((list_trace[-1].split(' '))[1]))
# chia thành các từ và thời gian mô phỏng được lấy từ từ thứ hai trong danh sách.

initialEnergy=float((list_trace[1].split(' '))[14])
FinalEnergy=float((list_trace[-1].split(' '))[14])
energyConsumed=initialEnergy - FinalEnergy

pp('Năng Lượng Ban Đầu - Initial Energy: {} '.format(initialEnergy))
pp('Năng Lượng Cuối Cùng - Final Energy: {}'.format(energyConsumed))
pp('Năng Lượng Tiêu Thụ - Energy Consumed: {}'.format(FinalEnergy))

graph_data.write('%d %d %d\n' % (send_count,received_count,dropped_count))  #Ghi số liệu thống kê gói vào tệp
energy_data.write('%d %d %d\n' % (initialEnergy,FinalEnergy,energyConsumed))

data_trace.close()
graph_data.close()
energy_data.close()
