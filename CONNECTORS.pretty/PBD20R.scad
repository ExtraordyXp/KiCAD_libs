pin_width = 0.8;
pin_thickness = 0.4;
pin_step = 2.54;
pin_bottom = 3.2;
pin_to_case = 1.4;

pins_in_a_row = 10;

case_w = pins_in_a_row*pin_step;
case_th = 8.6;
case_h = 2*pin_step;


module pin(_x,_y,_height)
{
	translate([-_x/2,-_y/2,0])
		cube([_x,_y,_height]);
};

module pins_array(_x,_y,_cnt, _distance, _height)
{
	if (_cnt>0)
	{
		for (_i = [0:_cnt-1])
		{
			translate([_distance*_i,0,0])
				pin(_x,_y,_height);
		}
	}
}

module pinhole_array(_cnt, _distance)
{
	if (_cnt>0)
	{
		for (_i = [0:_cnt-1])
		{
            translate([_distance*_i,0,0])
            rotate(90,[1,0,0])
            polyhedron(
                points=[ [pin_step/2,pin_step/2,0],[pin_step/2,-pin_step/2,0],[-pin_step/2,-pin_step/2,0],[-pin_step/2,pin_step/2,0],
                   [0,0,pin_step/2]  ],
                faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],
                    [1,0,3],[2,1,3] ]
            );
		}
	}
}


union()
{   
    // First vertical array of pins
    translate([0,0,-pin_bottom])
    pins_array(pin_width, pin_thickness, pins_in_a_row,pin_step, pin_bottom+pin_step/2);

    // Second vertical array of pins
    translate([0,-pin_step,-pin_bottom])
    pins_array(pin_width, pin_thickness, pins_in_a_row,pin_step, pin_bottom+pin_step*1.5);
    
    // First Horizontal array of pins
    translate([0,pin_to_case,pin_step*1.5])
    rotate([90,0,0])
    pins_array(pin_width, pin_thickness, pins_in_a_row,pin_step, pin_step+pin_to_case+pin_thickness/2);

    // Second Horizontal array of pins
    translate([0,pin_to_case,pin_step*0.5])
    rotate([90,0,0])
    pins_array(pin_width, pin_thickness, pins_in_a_row,pin_step, pin_to_case+pin_thickness/2);

    difference()
    {
        // Draw case
        translate([-pin_step/2,pin_to_case,0])
        cube([case_w,case_th,case_h]);

        union()
        {
            // Draw holes
            translate([0,case_th+pin_to_case+pin_step/5,pin_step*1.5])
            pinhole_array(pins_in_a_row, pin_step);
            translate([0,case_th+pin_to_case+pin_step/5,pin_step*0.5])
            pinhole_array(pins_in_a_row, pin_step);
            // First Horizontal array of pins
            translate([0,pin_to_case+case_th,pin_step*1.5])
            rotate([90,0,0])
            pins_array(pin_width, pin_width, pins_in_a_row,pin_step, pin_to_case+pin_thickness/2);
            // Second Horizontal array of pins
            translate([0,pin_to_case+case_th,pin_step*0.5])
            rotate([90,0,0])
            pins_array(pin_width, pin_width, pins_in_a_row,pin_step, pin_to_case+pin_thickness/2);
        }
    }
};