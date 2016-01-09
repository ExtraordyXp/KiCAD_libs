pin_w_b = 0.6;
pin_t_b = 0.2;
pin_l_b = 0.8;
pin_l_b2 = 1.3;
pin_xy_t = 0.35;

ground_x_b = 1;
ground_y_b = 2;
ground_z_b = 3;
ground_off = 3;

case_x = 10.37;
case_y = 4.4;
case_z = 7.85;
case_hole1_th = 0.5;
case_hole2_th = 0.9;

cylinder_dia=1;

pin_thickness = 0.4;
pin_step = 1.27;
hor_pin_length = 2.285;

pin_height = 6;
pins_per_row = 6;

plastic_height = 2.9;
plastic_width = 3.4;

notch_width = 5.08;
window_width = 2.16;
notch_thickness = 0.8;

module pin(_x,_y,_z)
{
	translate([-_x/2,-_y/2,0])
		cube([_x,_y,_z]);
};

module pins_array_b(_cnt, _distance, _length)
{
	if (_cnt>0)
	{
		for (_i = [0:_cnt-1])
		{
			translate([_distance*_i,0,0])
				pin(pin_w_b,_length,pin_t_b);
		}
	}
}

module pins_array_t(_cnt, _distance, _length)
{
	if (_cnt>0)
	{
		for (_i = [0:_cnt-1])
		{
			translate([_distance*_i,0,0])
				pin(pin_xy_t,pin_xy_t,_length);
		}
	}
}

module pins_bottom()
{
    translate([0,-case_y/2-pin_l_b/2,0])
    union()
    {
        pins_array_b(pins_per_row,pin_step,pin_l_b);
        translate([0,case_y+pin_l_b,0])
        pins_array_b(pins_per_row,pin_step,pin_l_b);

        translate([0,pin_l_b2/2+pin_l_b/2-pin_t_b,pin_t_b])
        pins_array_b(pins_per_row,pin_step,pin_l_b2);
        translate([0,case_y+pin_l_b/2-pin_l_b2/2+pin_t_b,pin_t_b])
        pins_array_b(pins_per_row,pin_step,pin_l_b2);
    }
}

union()
{   
    // Array of bottom pins
    pins_bottom();
    translate([0,pin_step/2,pin_t_b*2+0.01])
    pins_array_t(pins_per_row,pin_step,case_z);
    translate([0,-pin_step/2,pin_t_b*2+0.01])
    pins_array_t(pins_per_row,pin_step,case_z);
    
    // Grounding pins
    translate([-(case_x-(pins_per_row-1)*pin_step)/2-ground_x_b/2,ground_y_b/2+ground_off/2,0])
    pin(ground_x_b,ground_y_b,pin_t_b);
    translate([-(case_x-(pins_per_row-1)*pin_step)/2-ground_x_b/2,-ground_y_b/2-ground_off/2,0])
    pin(ground_x_b,ground_y_b,pin_t_b);
    translate([(case_x+(pins_per_row-1)*pin_step)/2+ground_x_b/2,ground_y_b/2+ground_off/2,0])
    pin(ground_x_b,ground_y_b,pin_t_b);
    translate([(case_x+(pins_per_row-1)*pin_step)/2+ground_x_b/2,-ground_y_b/2-ground_off/2,0])
    pin(ground_x_b,ground_y_b,pin_t_b);
    // Ground sides
    translate([-(case_x-(pins_per_row-1)*pin_step)/2-pin_t_b/2,0,0])
    difference()
    {
        translate([0,0,pin_t_b])
        pin(pin_t_b,case_y-pin_t_b*2,ground_z_b);
        translate([0,0,pin_t_b-0.05])
        pin(pin_t_b+0.1,ground_off,ground_z_b/3);
    }
    translate([(case_x+(pins_per_row-1)*pin_step)/2+pin_t_b/2,0,0])
    difference()
    {
        translate([0,0,pin_t_b])
        pin(pin_t_b,case_y-pin_t_b*2,ground_z_b);
        translate([0,0,pin_t_b-0.05])
        pin(pin_t_b+0.1,ground_off,ground_z_b/3);
    }
    translate([-(case_x-(pins_per_row-1)*pin_step)/2-pin_t_b/2,0,0])
    cylinder($fn = 10,h = pin_t_b*4, d=cylinder_dia);
    translate([(case_x+(pins_per_row-1)*pin_step)/2+pin_t_b/2,0,0])
    cylinder($fn = 10,h = pin_t_b*4, d=cylinder_dia);

    // Case
    difference()
    {
    translate([-(case_x-(pins_per_row-1)*pin_step)/2,-case_y/2,pin_t_b*2])
    cube([case_x,case_y,case_z]);

    union()
    {
        translate([-(case_x-(pins_per_row-1)*pin_step)/2+case_hole1_th,0,pin_t_b*2+2])
        cube([case_x-case_hole1_th*2,case_y/2-case_hole1_th,case_z]);
        
        translate([-(case_x-(pins_per_row-1)*pin_step)/2+case_hole2_th,case_hole1_th-case_y/2,pin_t_b*2+2])
        cube([case_x-case_hole2_th*2,case_y/2-case_hole1_th+0.01,case_z]);
    }
    }
};