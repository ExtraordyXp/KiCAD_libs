off = 0.1;

module pin()
{
    translate([0,-0.5,0])
        cube([0.9,1,0.8+2*off], center=false);
}

module hole()
{
    translate([0,0,-off])
        cylinder(r=0.3,h=0.8+4*off,$fn=10);
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

module holes_array(_cnt, _distance)
{
	if (_cnt>0)
	{
		for (_i = [0:_cnt-1])
		{
			translate([0,_distance*_i,0])
				hole();
		}
	}
}

difference()
{
	union()
	{
		// Left pins
		translate([-off,1.79,0])
			pins_array(13,1.5);

		// Bottom pins
		translate([1.27,-off,0])
			mirror([1,0,0])
				rotate([0,0,90])
					pins_array(8,1.5);

		// Right pins
		translate([13+off,1.79,0])
			mirror([1,0,0])
				pins_array(13,1.5);

		difference()
		{
			union()
			{
				translate([0,0,off])
					cube([13,26.9,0.8], center=false);

				translate([3.5,7,off])
					cube([6.15,6.15,1.8], center=false);
			}
			translate([-off,22,0.8-off])
				cube([14,7,0.8], center=false);
		}
	}

	// Holes
	union()
	{
		// Left holes
		translate([-off,1.79,0])
			holes_array(13,1.5);

		// Bottom holes
		translate([1.27,-off,0])
			mirror([1,0,0])
				rotate([0,0,90])
					holes_array(8,1.5);

		// Right holes
		translate([13+off,1.79,0])
			mirror([1,0,0])
				holes_array(13,1.5);
	}
}