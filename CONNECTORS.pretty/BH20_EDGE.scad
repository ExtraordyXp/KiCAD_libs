module pin()
{
	translate([-0.325,-0.325,-3])
		cube([0.65,0.65,11.54]);
    //linear_extrude(2.54)
    //    polygon(points=[[-0.97,-1.27],[0.97,-1.27],[1.27,-0.97],[1.27,0.97],[0.97,1.27],[-0.97,1.27],[-1.27,0.97],[-1.27,-0.97]], paths=[[0,1,2,3,4,5,6,7]]);
};

module pins_array(_cnt, _distance)
{
	if (_cnt>0)
	{
		for (_i = [0:_cnt-1])
		{
			translate([_distance*_i,-0.65/2,0])
				pin();
		}
	}
}


union()
{   
    // Top array of pins
    rotate(270, [1, 0, 0])
        pins_array(10,2.54);
    // Bottom array of pins
    translate([0,0,-2.54])
        rotate(270, [1, 0, 0])
            pins_array(10,2.54);
    
    // Case with notch
    difference()
    {
        // Case
        translate([-33/2+2.54*4.5,0,-8.75/2-2.54/2+0.65/2])
            difference()
            {
                cube([33,8.75,8.75]);
            
                translate([1,1.5,1])
                    cube([31,7.5,6.75]);
            }
        translate([2.54*4.5-4.55/2,1.5,1.6])
            cube([4.55,8,2]);
    }
};