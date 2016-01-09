use <case.scad>
use <pin.scad>

case_z = 1.2;   // Case size X
case_x = 4.3;   // Case size Y
case_y = 6.5;   // Case size Z

case_a1t = 75;  // Side1 top angle
case_a1b = 90;  // Side1 bottom angle
case_a2t = 75;  // Side2 top angle
case_a2b = 90;  // Side2 bottom angle
case_a3t = 75;  // Side3 top angle
case_a3b = 90;  // Side3 bottom angle
case_a4t = 75;  // Side4 top angle
case_a4b = 90;  // Side4 bottom angle

notch_d=0;          // Notch diameter
notch_depth=0.1;    // Notch depth
notch_x=0.8;        // Notch offset X
notch_y=0.8;        // Notch offset Y

side1_pins = 2;     // Number of pins on side 1
side2_pins = 1;     // Number of pins on side 1
side3_pins = 1;     // Number of pins on side 1
side4_pins = 1;     // Number of pins on side 1
pin_distance1 = 2.2;   // Number of pins on side 1
pin_distance2 = 0;   // Number of pins on side 2
pin_distance3 = 0;   // Number of pins on side 3
pin_distance4 = 0;   // Number of pins on side 4

pin_th = 0.2;
pin_W1 = 1.3;
pin_W2 = 0.75;
pin_W3 = 2.1;
pin_W4 = 0.75;
pin_off1 = 0;
pin_off2 = -0.75;
pin_off3 = 0;
pin_off4 = -0.75;
pin_L = 0.15;
pin_H = case_z/2+pin_th/2;
pin_l = 0.15;
pin_a = 90;

// Array of pins
// _cnt - number of pins
// _distance - distance between pin centres
module pins_array(_cnt, _distance, _pin_w)
{
	if (_cnt>0)
	{
		for (_i = [0:_cnt-1])
		{
			translate([_distance*_i,0,0])
				pin(pin_L,pin_l,pin_H,pin_th,pin_a,_pin_w);
		}
	}
}

// Complete model
union()
{
	// Top pins
	translate([(side1_pins-1)*pin_distance1/2 + (-side3_pins+1)*pin_distance3/2+pin_off3,case_y+pin_L*2,0])
		mirror([0,1,0])
			pins_array(side3_pins, pin_distance3, pin_W3);

	// Bottom pins
    translate([0,0,0])
        pins_array(side1_pins, pin_distance1, pin_W1);

	// Left pins
	translate([-(case_x-(side1_pins-1)*pin_distance1)/2 - pin_L,pin_L+case_y/2-(side4_pins-1)*pin_distance4/2+pin_off4,0])
		mirror([1,0,0])
			rotate([0,0,90])
				pins_array(side4_pins, pin_distance4, pin_W4);

	// Right pins
	translate([-(case_x-(side1_pins-1)*pin_distance1)/2-pin_L+case_x+2*pin_L,pin_L+case_y/2-(side2_pins-1)*pin_distance2/2+pin_off2,0])
		mirror([0,1,0])
			mirror([0,1,0])
				rotate([0,0,90])
					pins_array(side2_pins, pin_distance2, pin_W2);

	// Case
	translate([-(case_x-(side1_pins-1)*pin_distance1)/2,pin_L,0])
		case(case_x,case_y,case_z,pin_H,pin_th,case_a4t,case_a2t,case_a3t,case_a1t,case_a4b,case_a2b,case_a3b,case_a1b, notch_x,notch_y,notch_d,notch_depth);
}