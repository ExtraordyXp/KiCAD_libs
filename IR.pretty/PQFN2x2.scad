difference()
{
    union()
    {
        translate([0,0.025,0.05])
        cube([2,2,0.9]);

        translate([0.2,0,0])
        cube([0.3,0.3,0.1]);
        translate([0.2+0.65,0,0])
        cube([0.3,0.3,0.1]);
        translate([0.2+2*0.65,0,0])
        cube([0.3,0.3,0.1]);

        translate([0.2,2-0.25,0])
        cube([0.3,0.3,0.1]);
        translate([0.2+0.65,2-0.25,0])
        cube([0.3,0.3,0.1]);
        translate([0.2+2*0.65,2-0.25,0])
        cube([0.3,0.3,0.1]);

        translate([2-0.23-0.15,0.61,0])
        cube([0.23,0.785,0.1]);

        linear_extrude(height = 0.1, center = false, convexity = 10)
        translate([0.22,0.4+0.025,0])
        polygon(points=[[0,0.15],[0,1.2],[1,1.2],[1,0],[0.15,0]]);
    }
    translate([0.4,0.4,0.9])
    cylinder(r=0.2,h=0.1,$fn=10);
}