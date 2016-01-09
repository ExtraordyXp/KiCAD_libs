use <case.scad>
use <pin.scad>

case_z = 2.3;
case_x = 18;
case_y = 7.5;
case_a = 75;

notch_d=0.9;
notch_depth=0.1;
notch_x=1.2;
notch_y=1.2;

side1_pins = 14;
side2_pins = 0;
side3_pins = 14;
side4_pins = 0;
pin_distance = 1.27;

pin_th = 0.2;
pin_W = 0.45;
pin_L = 1.5;
pin_H = case_z/2+pin_th/2;
pin_l = 0.6;
pin_a = 115;

// Array of pins
// _cnt - number of pins
// _distance - distance between pin centres
module pins_array(_cnt, _distance)
{
	if (_cnt>0)
	{
		for (_i = [0:_cnt-1])
		{
			translate([_distance*_i,0,0])
				pin(pin_L,pin_l,pin_H,pin_th,pin_a,pin_W);
		}
	}
}

// Complete model
union()
{
	// Top pins
	translate([(side1_pins-side3_pins)*pin_distance/2,case_y+pin_L*2,0])
		mirror([0,1,0])
			pins_array(side3_pins, pin_distance);

	// Bottom pins
	pins_array(side1_pins, pin_distance);

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