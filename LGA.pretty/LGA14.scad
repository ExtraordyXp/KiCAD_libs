off = 0.1;

module pin()
{
    translate([0,-0.1,0])
        cube([0.275,0.2,0.1], center=false);
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
    translate([0.1,-0.6 + 1.1,0])
        pins_array(4,0.4);

    // Bottom pins
    translate([1.1 - 0.4,0.1,0])
        mirror([1,0,0])
            rotate([0,0,90])
                pins_array(3,0.4);

    // Right pins
    translate([2.2-0.1,-0.6+1.1,0])
        mirror([1,0,0])
            pins_array(4,0.4);

    // top pins
    translate([1.1-0.4,2.2-0.275-0.1,0])
        mirror([1,0,0])
            rotate([0,0,90])
                pins_array(3,0.4);
    
    translate([0.375-0.225,2.2-0.15-0.15,0])
    cube([0.225,0.15,0.1], center=false);

    // Case
    translate([0,0,0.05])
    cube([2.2,2.2,0.95], center=false);

}
translate([0.4,2.2-0.4,0.95])
cylinder(r=0.2,h=0.1,$fn=10);
}