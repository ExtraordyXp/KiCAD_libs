use <case.scad>
use <pin.scad>

case_z = 1.1;
case_x = 3;
case_y = 3;
case_a = 75;

notch_d=0.5;
notch_depth=0.1;
notch_x=0.7;
notch_y=0.7;

side1_pins = 5;
side2_pins = 0;
side3_pins = 5;
side4_pins = 0;
pin_distance = 0.5;

pin_th = 0.18;
pin_W = 0.22;
pin_L = 1.0;
pin_H = case_z/2+pin_th/2;
pin_l = 0.45;
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