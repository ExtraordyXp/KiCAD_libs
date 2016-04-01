use <..\openscad\case.scad>

case_z = 0.7;   // Case size X
case_x = 0.8;   // Case size Y
case_y = 1.2;   // Case size Z

case_a1t = 83;  // Side1 top angle
case_a1b = 90;  // Side1 bottom angle
case_a2t = 83;  // Side2 top angle
case_a2b = 90;  // Side2 bottom angle
case_a3t = 83;  // Side3 top angle
case_a3b = 90;  // Side3 bottom angle
case_a4t = 83;  // Side4 top angle
case_a4b = 90;  // Side4 bottom angle

notch_d=0;          // Notch diameter
notch_depth=0.1;    // Notch depth
notch_x=0.4;        // Notch offset X
notch_y=0.9;        // Notch offset Y

side1_pins = 1;     // Number of pins on side 1
side2_pins = 0;     // Number of pins on side 1
side3_pins = 1;     // Number of pins on side 1
side4_pins = 0;     // Number of pins on side 1
pin_distance1 = 0.95;   // Number of pins on side 1
pin_distance2 = 0;   // Number of pins on side 2
pin_distance3 = 1.9;   // Number of pins on side 3
pin_distance4 = 0;   // Number of pins on side 4

pin_th = 0;
pin_W1 = 0;
pin_W2 = 0;
pin_W3 = 0;
pin_W4 = 0;
pin_off1 = 0;
pin_off2 = 0;
pin_off3 = 0;
pin_off4 = 0;
pin_L = 0;
pin_H = 0.15;
pin_l = 0;
pin_a = 0;

// Complete model
difference()
{
    union()
    {
        // Top pins
        translate([(side1_pins-1)*pin_distance1/2 + (-side3_pins+1)*pin_distance3/2+pin_off3 - 0.12,case_y+0.4,0])
            mirror([0,1,0])
                cube(size = [0.24,0.3,0.15], center = false);

        // Bottom pins
        translate([-0.12,0,0])
            cube(size = [0.24,0.3,0.15], center = false);

        // Case
        translate([-(case_x-(side1_pins-1)*pin_distance1)/2,0.2,0.05])
            case(case_x,case_y,case_z,pin_H,pin_th,case_a4t,case_a2t,case_a3t,case_a1t,case_a4b,case_a2b,case_a3b,case_a1b, notch_x,notch_y,notch_d,notch_depth);
    }
	translate([-0.25,case_y - 0.15,case_z])
        cube(size = [0.5,0.2,1], center = false);
}