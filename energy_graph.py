import matplotlib.pyplot as plt
import numpy as np

initialEnergy = []
finalEnergy = []
energyConsumed = []

with open('energy_graph.txt', 'r') as data:
    for line in data:
        demo = line.split()
        if len(demo) >= 3:
            try:
                initialEnergy.append(int(demo[0]))
                finalEnergy.append(int(demo[1]))
                energyConsumed.append(int(demo[2]))
            except ValueError:
                print(f"Invalid data in line: {line}")
# Cập nhật số lượng nhóm để khớp với số lượng điểm dữ liệu
n_groups = 3
fig, ax = plt.subplots()
index = np.arange(n_groups)
bar_width = 0.25
opacity = 0.8

rects1 = plt.bar(index, initialEnergy, bar_width, alpha=opacity, color='g', label='Năng Lượng Ban Đầu - Initial Energy')
rects2 = plt.bar(index + bar_width, finalEnergy, bar_width, alpha=opacity, color='b', label='Năng Lượng Cuối Cùng - Final Energy')
rects3 = plt.bar(index + bar_width + bar_width, energyConsumed, bar_width, alpha=opacity, color='r', label='Năng Lượng Tiêu Thụ - Energy Consumed')

plt.xlabel('Tên Giao Thức')
plt.ylabel('Lượng năng lượng _ Energy Amount')
plt.xticks(index + bar_width, ('DSDV', 'AODV', 'DSR'))
plt.legend()
plt.tight_layout()
plt.show()