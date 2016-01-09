pin_thickness = 0.4;
pin_step = 1.27;
hor_pin_length = 2.285;

pin_height = 6;
pins_per_row = 5;

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

module pins_array(_cnt, _distance, _height)
{
	if (_cnt>0)
	{
		for (_i = [0:_cnt-1])
		{
			translate([_distance*_i,0,0])
				pin(pin_thickness,pin_thickness,_height);
		}
	}
}


union()
{   
    // Array1 of pins
    pins_array(pins_per_row,pin_step,pin_height);
    // Array2 of pins
    translate([0,pin_step,0])
        pins_array(pins_per_row,pin_step,pin_height);
    // Array3 of pins
    translate([0,pin_thickness/2,pin_thickness/2])
    rotate(90,[1,0,0])
    pins_array(pins_per_row,pin_step,hor_pin_length+pin_thickness/2);
    // Array4 of pins
    translate([0,pin_step+hor_pin_length,pin_thickness/2])
    rotate(90,[1,0,0])
    pins_array(pins_per_row,pin_step,hor_pin_length+pin_thickness/2);
    
    // Draw case
    translate([-pin_step/2,-plastic_width/2+pin_step/2,pin_thickness])
    cube([pins_per_row*pin_step,plastic_width,plastic_height]);
    
    // Draw notch1
    translate([pin_step*(pins_per_row-1)/2-notch_width/2,(plastic_width-pin_step)/2+pin_step,pin_thickness])
    cube([notch_width,notch_thickness,pin_height-pin_thickness]);

    // Draw notch2
    difference()
    {
    translate([pin_step*(pins_per_row-1)/2-notch_width/2,-(plastic_width-pin_step)/2-notch_thickness,pin_thickness])
    cube([notch_width,notch_thickness,pin_height-pin_thickness]);

    translate([pin_step*(pins_per_row-1)/2-window_width/2,-(plastic_width-pin_step)/2-notch_thickness-0.05,pin_thickness+plastic_height])
    cube([window_width,notch_thickness+0.1,pin_height-pin_thickness-plastic_height+0.1]);
    }
};