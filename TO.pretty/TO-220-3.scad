use <..\openscad\case.scad>
use <..\openscad\pin.scad>

case_z = 4.5;   // Case size X
case_x = 10.2;   // Case size Y
case_y = 9.0;   // Case size Z

case_a1t = 80;  // Side1 top angle
case_a1b = 80;  // Side1 bottom angle
case_a2t = 80;  // Side2 top angle
case_a2b = 90;  // Side2 bottom angle
case_a3t = 75;  // Side3 top angle
case_a3b = 90;  // Side3 bottom angle
case_a4t = 80;  // Side4 top angle
case_a4b = 90;  // Side4 bottom angle

notch_d=0;          // Notch diameter
notch_depth=0.1;    // Notch depth
notch_x=0.8;        // Notch offset X
notch_y=0.8;        // Notch offset Y

mount_h = 6.1;
mount_th = 1.2;

pins = 3;     // Number of pins on side 1
pin_distance = 2.54;   // Number of pins on side 1

pin_th = 0.65;
pin_L = 5;
pin_l = 10;
pin_W = 1.7;
pin_w = 1;
pin_H = 2.7;

include <..\openscad\case_with_pins_th.scad>
difference()
{
    translate([-(case_x - (pins-1)*pin_distance)/2,case_y+pin_l+pin_L,-pin_H+pin_th/2])
        cube([case_x,mount_h,mount_th]);
    
    translate([case_x/2-(case_x - (pins-1)*pin_distance)/2,case_y+pin_l+pin_L+mount_h/2,-pin_H+pin_th/2-mount_th/2])
    cylinder(r=3.8/2,h=mount_th*2,$fn=20);
}
