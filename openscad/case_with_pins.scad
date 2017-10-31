// Array of pins
// _cnt - number of pins
// _distance - distance between pin centres
module pins_array(_pin_L, _cnt, _distance, _pin_w)
{
	if (_cnt>0)
	{
		for (_i = [0:_cnt-1])
		{
			translate([_distance*_i,0,0])
				pin(_pin_L,pin_l,pin_H,pin_th,pin_a,_pin_w);
		}
	}
}

// Complete model
union()
{
	// Top pins
	translate([(side1_pins-1)*pin_distance1/2 + (-side3_pins+1)*pin_distance3/2+pin_off3,case_y+pin_L1+pin_L3,0])
		mirror([0,1,0])
			pins_array(pin_L3, side3_pins, pin_distance3, pin_W3);

	// Bottom pins
    translate([0,0,0])
        pins_array(pin_L1, side1_pins, pin_distance1, pin_W1);

	// Left pins
	translate([-(case_x-(side1_pins-1)*pin_distance1)/2 - pin_L4,pin_L1+case_y/2-(side4_pins-1)*pin_distance4/2+pin_off4,0])
		mirror([1,0,0])
			rotate([0,0,90])
				pins_array(pin_L4, side4_pins, pin_distance4, pin_W4);

	// Right pins	
    translate([-(case_x-(side1_pins-1)*pin_distance1)/2-pin_L4+case_x+pin_L4 + pin_L2,pin_L1+case_y/2-(side2_pins-1)*pin_distance2/2+pin_off2,0])
		mirror([0,1,0])
			mirror([0,1,0])
				rotate([0,0,90])
					pins_array(pin_L2, side2_pins, pin_distance2, pin_W2);

	// Case
	translate([-(case_x-(side1_pins-1)*pin_distance1)/2,pin_L1,0])
        case(case_x,case_y,case_z,pin_H,pin_th,case_a4t,case_a2t,case_a3t,case_a1t,case_a4b,case_a2b,case_a3b,case_a1b, notch_x,notch_y,notch_d,notch_depth);
}