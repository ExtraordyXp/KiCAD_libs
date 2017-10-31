pin_w  = 0.25;
pin_th = 0.1;
pin_l  = 0.55;
pin_sp = 0.5;

pins_1 = 7;
pins_2 = 7;
pins_3 = 7;
pins_4 = 7;

case_w = 5.0;
case_h = 5.0;
case_th = 0.9;

module pin()
{
    translate([0,-pin_w/2,0])
        cube([pin_l,pin_w,pin_th], center=false);
}

module pins_array(_cnt, _distance)
{
	if (_cnt>0)
	{
		for (_i = [0:_cnt-1])
		{
			translate([0,_distance*_i,0])
				pin();
		}
	}
}
difference()
{
union()
{
    // Left pins
    translate([0,(case_h - (pins_1-1)*pin_sp)/2,0])
        pins_array(pins_1,pin_sp);

    // Bottom pins
    translate([(case_w - (pins_2-1)*pin_sp)/2,0,0])
        mirror([1,0,0])
            rotate([0,0,90])
                pins_array(pins_2,pin_sp);

    // Right pins
    translate([case_w,(case_h - (pins_3-1)*pin_sp)/2,0])
        mirror([1,0,0])
            pins_array(pins_3,pin_sp);

    // top pins
    translate([(case_w - (pins_4-1)*pin_sp)/2,case_h - pin_l,0])
        mirror([1,0,0])
            rotate([0,0,90])
                pins_array(pins_4,pin_sp);
    
    translate([(case_w-(pins_2-1)*pin_sp - pin_w)/2,(case_h-(pins_1-1)*pin_sp - pin_w)/2,0])
        cube([(pins_2-1)*pin_sp+pin_w,(pins_1-1)*pin_sp +pin_w,pin_th], center=false);

    // Case
    translate([0,0,pin_th])
    cube([case_w,case_h,case_th], center=false);

}
translate([0.4,0.4,case_th+pin_th/2])
cylinder(r=0.2,h=0.1,$fn=10);
}