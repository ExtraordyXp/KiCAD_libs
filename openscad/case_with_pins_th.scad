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
				pin_th(pin_th, pin_L, pin_l,pin_W,pin_w);
		}
	}
}

// Complete model
union()
{
	// Top pins
	pins_array(pins, pin_distance);
	// Case
	translate([-(case_x - (pins-1)*pin_distance)/2,pin_L+pin_l,-pin_H+pin_th/2])
		case(case_x,case_y,case_z,pin_H,pin_th,case_a4t,case_a2t,case_a3t,case_a1t,case_a4b,case_a2b,case_a3b,case_a1b, notch_x,notch_y,notch_d,notch_depth);
}