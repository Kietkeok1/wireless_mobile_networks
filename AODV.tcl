set val(chan)   Channel/WirelessChannel    ;#  Loại kênh channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# Loại giao diện mạng network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq Gói tối đa trong ifq (độ dài hàng đợi giao diện)
set val(nn)     20                         ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      400                        ;# X dimension of topography
set val(y)      300                        ;# Y dimension of topography
set val(stop)   300.0                      ;#  tg kết thuc mophong


#Tạo trình giả lập ns
set ns [new Simulator]

#Thiết lập đối tượng địa hình - Topography đại diện cho các đối tượng địa hình trong mạng mô phỏng
set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

# Mở tệp theo dõi và thiết lập đối tượng địa hình
set tracefile [open AODV.tr w]
$ns trace-all $tracefile

#Mở tệp theo dõi nam và Tạo kênh không dây
set namfile [open AODV.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];# Tạo kênh không dây

# cấu hình các tham số nút, bao gồm định tuyến đặc biệt, lớp liên kết, MAC,
# hàng đợi giao diện, ăng-ten, lan truyền và giao diện vật lý
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
		-energyModel "EnergyModel" \
		-initialEnergy 50 \
		-txPower 0.09 \
		-rxPower 0.07 \
		-idlePower 0.01 \
		-sleeppower 0.0001 \
		-transitionPower 0.02 \
                -transitionTime 0.0005 \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON # Cho phép theo dõi các chuyển động của nút trong mô phỏng mạng.

#tạo 20 nút và đặt vị trí cho nó trong vùng mô phỏng
set n0 [$ns node]
$n0 set X_ 50
$n0 set Y_ 264
$n0 set Z_ 0.0
$ns initial_node_pos $n0 20
set n1 [$ns node]
$n1 set X_ 120
$n1 set Y_ 264
$n1 set Z_ 0.0
$ns initial_node_pos $n1 20
set n2 [$ns node]
$n2 set X_ 190
$n2 set Y_ 264
$n2 set Z_ 0.0
$ns initial_node_pos $n2 20
set n3 [$ns node]
$n3 set X_ 260
$n3 set Y_ 264
$n3 set Z_ 0.0
$ns initial_node_pos $n3 20
set n4 [$ns node]
$n4 set X_ 330
$n4 set Y_ 264
$n4 set Z_ 0.0
$ns initial_node_pos $n4 20
set n5 [$ns node]
$n5 set X_ 50
$n5 set Y_ 206
$n5 set Z_ 0.0
$ns initial_node_pos $n5 20
set n6 [$ns node]
$n6 set X_ 120
$n6 set Y_ 206
$n6 set Z_ 0.0
$ns initial_node_pos $n6 20
set n7 [$ns node]
$n7 set X_ 190
$n7 set Y_ 206
$n7 set Z_ 0.0
$ns initial_node_pos $n7 20
set n8 [$ns node]
$n8 set X_ 260
$n8 set Y_ 206
$n8 set Z_ 0.0
$ns initial_node_pos $n8 20
set n9 [$ns node]
$n9 set X_ 330
$n9 set Y_ 206
$n9 set Z_ 0.0
$ns initial_node_pos $n9 20
set n10 [$ns node]
$n10 set X_ 50
$n10 set Y_ 152
$n10 set Z_ 0.0
$ns initial_node_pos $n10 20
set n11 [$ns node]
$n11 set X_ 120
$n11 set Y_ 152
$n11 set Z_ 0.0
$ns initial_node_pos $n11 20
set n12 [$ns node]
$n12 set X_ 190
$n12 set Y_ 152
$n12 set Z_ 0.0
$ns initial_node_pos $n12 20
set n13 [$ns node]
$n13 set X_ 260
$n13 set Y_ 152
$n13 set Z_ 0.0
$ns initial_node_pos $n13 20
set n14 [$ns node]
$n14 set X_ 330
$n14 set Y_ 152
$n14 set Z_ 0.0
$ns initial_node_pos $n14 20
set n15 [$ns node]
$n15 set X_ 50
$n15 set Y_ 101
$n15 set Z_ 0.0
$ns initial_node_pos $n15 20
set n16 [$ns node]
$n16 set X_ 120
$n16 set Y_ 101
$n16 set Z_ 0.0
$ns initial_node_pos $n16 20
set n17 [$ns node]
$n17 set X_ 190
$n17 set Y_ 101
$n17 set Z_ 0.0
$ns initial_node_pos $n17 20
set n18 [$ns node]
$n18 set X_ 260
$n18 set Y_ 101
$n18 set Z_ 0.0
$ns initial_node_pos $n18 20
set n19 [$ns node]
$n19 set X_ 330
$n19 set Y_ 101
$n19 set Z_ 0.0
$ns initial_node_pos $n19 20

# nút này sẽ di chuyển từ vị trí hiện tại của nó đến tọa độ sau 2s
$ns at 2 " $n0 setdest 50 30 30 " 
$ns at 20 " $n4 setdest 50 290 30 " 


#Setup a UDP connection
#tạo 1 đối tượng ... id udp0 và gắn đối tượng $no = cách attach agent
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0

set null1 [new Agent/Null]
$ns attach-agent $n4 $null1

# ket nối 2 đối tượng = conect tạo kết nối |.| 2 để truyền dữ liệu
$ns connect $udp0 $null1
$udp0 set packetSize_ 1500 # kích thước g tin


#Thiết lập Ứng dụng CBR qua kết nối UDP
#tạo một đối tượng ứng dụng CBR  có id  cbr0.Gắn đối tượng cbr0 vào đối tượng udp0 bằng cách sử dụng attach-agent
set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp0

$cbr0 set packetSize_ 1000
$cbr0 set rate_ 1.0Mb
$cbr0 set random_ null # tỷ lệ và kích thước

$ns at 2.0 "$cbr0 start"
$ns at 290.0 "$cbr0 stop"


# ---------- dấu vết, đóng tệp dấu vết ----------ghi thông tin về mô phỏng vào file
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam AODV.nam &
    exit 0
}

# giá trị được save in biến nn_ Với mỗi giá trị i  câu lệnh trong khối lệnh bên trong
#giátrị SAVE trong biến stop để đặt lại trạng thái của nút _ sau khi mô phỏng kết thúc

for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n$i reset"
}

# kết thúc quá trình ghi dữ liệu
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
























$cbr0 set random_ null: Dòng này đặt giá trị của thuộc tính random_ là "null".
Thuộc tính này điều chỉnh tính ngẫu nhiên trong quá trình truyền dữ liệu của ứng dụng CBR.
Khi giá trị của thuộc tính này là "null", nghĩa là không có yếu tố ngẫu nhiên nào được áp dụng
và việc truyền dữ liệu sẽ theo đúng tỷ lệ và kích thước đã được định nghĩa.

Tóm lại, đoạn mã trên cấu hình ứng dụng CBR để truyền gói tin với kích thước 1000 byte,
tỷ lệ truyền là 1.0 Megabit trên giây và không có yếu tố ngẫu nhiên được áp dụng trong quá trình truyền dữ liệu.
Các giá trị này có thể được điều chỉnh tùy theo yêu cầu của ứng dụng và mạng cụ thể.

Dòng này lên lịch cho ứng dụng CBR ( $cbr0) bắt đầu truyền dữ liệu vào thời điểm 2.0 giây trong mô phỏng.
 Điều này đảm bảo rằng sau 2.0 giây kể từ khi mô phỏng bắt đầu, ứng dụng CBR sẽ bắt đầu truyền dữ liệu

 for {set i 0} {
val(nn)} {incr i}: Đây là một vòng lặp for để lặp qua các giá trị từ 0 đến $val(nn) (giá trị được lưu trữ trong biến nn).
Với mỗi giá trị i, vòng lặp sẽ thực hiện các câu lệnh trong khối lệnh bên trong.

val(stop) "$n$i reset": Dòng này lên lịch cho mỗi nút (
i) tại thời điểm $val(stop) (giá trị được lưu trữ trong biến stop) để đặt lại trạng thái của nút.
Điều này có thể áp dụng các thao tác đặt lại cho nút sau khi mô phỏng kết thúc.
