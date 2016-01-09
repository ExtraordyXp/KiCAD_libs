use <case.scad>
use <pin.scad>

case_z = 1.6;
case_x = 6.5;
case_y = 3.5;
case_a = 75;

notch_d=0;
notch_depth=0.1;
notch_x=0.8;
notch_y=0.8;

side1_pins = 3;
side2_pins = 0;
side3_pins = 1;
side4_pins = 0;
pin_distance = 2.3;

pin_th = 0.28;
pin_W1 = 0.7;
pin_W2 = 0;
pin_W3 = 3;
pin_W4 = 0;
pin_L = 1.75;
pin_H = case_z/2+pin_th/2;
pin_l = 0.7;
pin_a = 125;

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
	translate([(side1_pins-side3_pins)*pin_distance/2,case_y+pin_L*2,0])
		mirror([0,1,0])
			pins_array(side3_pins, pin_distance, pin_W3);

	// Bottom pins
	pins_array(side1_pins, pin_distance, pin_W1);

	// Left pins
	translate([-(case_x-(side1_pins-1)*pin_distance)/2 - pin_L,pin_L+case_y/2-(side4_pins-1)*pin_distance/2,0])
		mirror([1,0,0])
			rotate([0,0,90])
				pins_array(side4_pins, pin_distance);

	// Right pins
	translate([-(case_x-(side1_pins-1)*pin_distance)/2-pin_L+case_x+2*pin_L,pin_L+case_y/2-(side2_pins-1)*pin_distance/2,0])
		mirror([0,1,0])
			mirror([0,1,0])
				rotate([0,0,90])
					pins_array(side2_pins, pin_distance);

	// Case
	translate([-(case_x-(side1_pins-1)*pin_distance)/2,pin_L,0])
		case(case_x,case_y,case_z,pin_H,pin_th,case_a,case_a,case_a,case_a,case_a,case_a,case_a,case_a, notch_x,notch_y,notch_d,notch_depth);
}