difference (){
    union(){
        // case
        translate([-0.1,-0.1,0.05])
            cube(size=[3.8,3.6,0.2], center = false);
        translate([0.05,0.05,0.1])
            cube(size=[3.5,3.3,0.2], center = false);
        translate([0.3,0.3,0.3])
            cube(size=[3,2.8,0.63], center = false);

        // pins
        cube(size = [0.6,0.5,0.1], center=false);
        translate([1.5,0,0])
            cube(size = [0.6,0.5,0.1], center=false);
        translate([3,0,0])
            cube(size = [0.6,0.5,0.1], center=false);
        translate([0,-0.05 + 1.45,0])
            cube(size = [0.5,0.6,0.1], center=false);
        translate([3,-0.05 + 2.9,0])
            cube(size = [0.6,0.5,0.1], center=false);
        translate([1.5,-0.05 + 2.9,0])
            cube(size = [0.6,0.5,0.1], center=false);
        translate([0,-0.05 + 2.9,0])
            cube(size = [0.6,0.5,0.1], center=false);
    }

    translate([3.8-1.22,3.6-0.88,1])
        cylinder (h=0.2,d=0.5,center = true, $fn = 10);
}
