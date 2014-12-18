# Com prievado nustatymas 
use Device::SerialPort;
my $port = new Device::SerialPort("/dev/ttyUSB0"); 
$port->databits(8);
$port->baudrate(115200);
$port->parity("none");
$port->stopbits(1); 

#varikliu nustatymas i centrine padeti (ji gali keistis) 
 $servo_0 = 1480;
$servo_1 = 1493;
$servo_2 = 1500;
$servo_3 = 1520; 

#servu greicio skaiciavimas 
 
$servo_0 = 1480;
$servo_1 = 1493;
$servo_2 = 1500;
$servo_3 = 1520;
#servu greicio skaiciavimas
 
#servo_0 - baze
 $servo_0_fw = $servo_0 + 20;
$servo_0_fw_fast = $servo_0 + 45;
$servo_0_back = $servo_0 - 40;
$servo_0_back_fast = $servo_0 - 60;
#servo_1 - petys
 $servo_1_fw = $servo_1 + 30;
$servo_1_fw_slow = $servo_1 + 20;
$servo_1_fw_fast = $servo_1 + 50;
$servo_1_fw_hold = $servo_1 - 5; #laiko itempta peti 
 $servo_1_back = $servo_1 - 30;
$servo_1_back_slow = $servo_1 - 20;
$servo_1_back_fast = $servo_1 - 50;
#servo_2 - alkune
 $servo_2_fw_slow = $servo_2 + 20;
$servo_2_fw = $servo_2 + 30;
$servo_2_fw_fast = $servo_2 + 50;
$servo_2_back = $servo_2 - 30;
$servo_2_back_slow = $servo_2 - 20;
$servo_2_back_fast = $servo_2 - 50;
$servo_2_back_hold = $servo_2 - 10; #laiko itempta alkune 
 
#servo_3 - riesas
 $servo_3_fw_slow = $servo_3 + 20;
$servo_3_fw = $servo_3 + 30;
$servo_3_fw_fast = $servo_3 + 50;
$servo_3_fw_w_fast = $servo_3 + 70;
$servo_3_back_slow = $servo_3 - 20;
$servo_3_back = $servo_3 - 30; 
$servo_3_back_fast = $servo_3 - 50; 
	# 13 12 11 10 9 8
$portBase = "#12";
$portShoulder = "#9";
$portElbow = "#13";
$portWristUpDown = "#11";
$portWristRotate = "#8";	#MIN - P0500. MAX - P2500
$portClaw = "#10";			#MIN - P1200. MAX - P2500

$penState = "P2250";
# readline(*STDIN);
# my $robo = $port->write("#13 P10000 \r");
#select(undef, undef, undef, 0.5);

#readline(*STDIN);

starting_position();
grab_pen();
starting_position_with_pen();
prepare_pen_for_writing();
LayPenDown_arrow();
LiftPenUp();
moveToEnter();
#LayPenDown_ENTER();
LayShoulderDown();
LayElbowDown();
#LiftPenUp();
starting_position_with_pen();
Laying_down_position_with_pen();









starting_position();



#my $robo = $port->write("$portBase P1500 $portShoulder P1500 $portElbow P1500 $portWristUpDown P1500 $portWristRotate P1500 $portClaw P1500 T1000 \r");
#select(undef, undef, undef, 2);







#my $robo = $port->write("$portShoulder P1500\r");
#select(undef, undef, undef, 2);
#my $robo = $port->write("$portElbow P1500 \r");
#select(undef, undef, undef, 2);
#my $robo = $port->write("$portWristUpDown P1500 \r");
#select(undef, undef, undef, 2);
#my $robo = $port->write("$portWristRotate P1500 \r");
#select(undef, undef, undef, 2);
#my $robo = $port->write("$portClaw P1500 \r");
#select(undef, undef, undef, 2);
#my $robo = $port->write("$portWristUpDown P2500 \r");
#select(undef, undef, undef, 3);
#my $robo = $port->write("$portShoulder P$servo_1_fw_fast \r");
#select(undef, undef, undef, 1);
#my $robo = $port->write("$portShoulder P$servo_1 $portElbow P$servo_2_fw_fast \r");
#select(undef, undef, undef, 0.3);
#my $robo = $port->write("$portBase P$servo_0 $portShoulder P$servo_1 $portElbow P$servo_2 $portElbowSpin P$servo_3 \r");
#select(undef, undef, undef, 0.1);
#readline(*STDIN);
#my $robo = $port->write("$port5 P900 \r");
#readline(*STDIN);
#my $robo = $port->write("$port5 P2500 \r");
#readline(*STDIN);
#select(undef, undef, undef, 0.5);
#my $robo = $port->write("$portShoulder P$servo_1_back_fast \r");
#select(undef, undef, undef, 0.45);
#my $robo = $port->write("$portShoulder P$servo_1 $portElbow P$servo_2_back_fast \r");
#select(undef, undef, undef, 0.5);
#my $robo = $port->write("$portBase P0 $portShoulder P0 $portElbow P0 $portElbowSpin P0 $portClaw P0 $port5 P0 \r");


sub starting_position(){
   my $robo = $port->write("$portBase P1500 $portShoulder P1500 $portElbow P1500 $portWristUpDown P1500 $portWristRotate P1500 $portClaw P1500 T1000 \r");
	select(undef, undef, undef, 2);
}

sub grab_pen(){
   my $robo = $port->write("$portBase P0500 								T300 \r");
	select(undef, undef, undef, 0.3);
	my $robo = $port->write("$portWristUpDown P1000 $portWristRotate $penState 	T300 \r");
	select(undef, undef, undef, 0.3);
	my $robo = $port->write("$portElbow P1100 $portShoulder P2000			T1000 \r");
	select(undef, undef, undef, 2);
	my $robo = $port->write("$portClaw $penState 								T1000 \r");
	select(undef, undef, undef, 2);
}

sub starting_position_with_pen(){
   my $robo = $port->write("$portBase P1380 $portShoulder P1500 $portElbow P1500 $portWristUpDown P1500 $portWristRotate P1500 $portClaw $penState T1000 \r");
   select(undef, undef, undef, 2);
}

sub prepare_pen_for_writing(){
   my $robo = $port->write("$portWristUpDown P0500 T1000 \r");
   select(undef, undef, undef, 2);
}

sub LayPenDown_arrow(){
   my $robo = $port->write("$portShoulder P2050 $portElbow P1575  T500 \r");
   select(undef, undef, undef, 0.5);
}

sub LiftPenUp(){
   my $robo = $port->write("$portShoulder P1700 T1500 \r");
   select(undef, undef, undef, 2);
}

sub moveToEnter(){
   my $robo = $port->write("$portBase P1500 									  T1500 \r");
   select(undef, undef, undef, 2);
}

sub LayPenDown_ENTER(){
	my $robo = $port->write("$portShoulder P2400 $portElbow P2200   T500 \r");
    select(undef, undef, undef, 0.5);
}

sub LayShoulderDown(){
	my $robo = $port->write("$portShoulder P2350  T1000 \r");
    select(undef, undef, undef, 1);
}

sub LayElbowDown(){
	my $robo = $port->write("$portElbow P2200     T1000 \r");
    select(undef, undef, undef, 1);
}

sub Laying_down_position_with_pen(){
	my $robo = $port->write("$portBase P0500 								T300 \r");
	select(undef, undef, undef, 0.3);
	my $robo = $port->write("$portWristUpDown P1000 $portWristRotate $penState 	T300 \r");
	select(undef, undef, undef, 0.3);
	my $robo = $port->write("$portElbow P1100 $portShoulder P2000			T1000 \r");
	select(undef, undef, undef, 1);
	my $robo = $port->write("$portClaw P1000 								T1000 \r");
	select(undef, undef, undef, 1);
}