pad_length = 0.8;

union()
{
	// Button
	translate([2-0.85,1.20,0.65])
		linear_extrude(height = 0.9, center = true)
			polygon(points=[[0,0],[0,0.4],[0.4,0.7],[1.3,0.7],[1.7,0.4],[1.7,0]]);

	// Case
	difference()
	{
		translate([0.5+0.2,-1.25+0.2,0.05])
			minkowski()
			{
				cube([3-0.4,2.5-0.4,1.0],center=false);
				cylinder(r=0.2,h=0.2,$fn=10);
			}


		translate([0.5+0.65,-0.5,1.35])
			linear_extrude(height = 0.4, center = true)
				polygon(points=[[0,0],[0,1],[0.3,1],[0.3,0.3],[1.7-0.3,0.3],[1.7-0.3,1],[1.7,1],[1.7,0]]);
	}

	// Left pin
	translate([0,-0.7,0])
		cube([pad_length,1.4,0.15], center=false);

	// Right pin
	translate([4-pad_length,-0.7,0])
		cube([pad_length,1.4,0.15], center=false);
}