use <..\openscad\case.scad>
use <..\openscad\pin.scad>

case_z = 1.2;   // Case size X
case_x = 4.3;   // Case size Y
case_y = 6.5;   // Case size Z

case_a1t = 75;  // Side1 top angle
case_a1b = 90;  // Side1 bottom angle
case_a2t = 75;  // Side2 top angle
case_a2b = 90;  // Side2 bottom angle
case_a3t = 75;  // Side3 top angle
case_a3b = 90;  // Side3 bottom angle
case_a4t = 75;  // Side4 top angle
case_a4b = 90;  // Side4 bottom angle

notch_d=0;          // Notch diameter
notch_depth=0.1;    // Notch depth
notch_x=0.8;        // Notch offset X
notch_y=0.8;        // Notch offset Y

side1_pins = 2;     // Number of pins on side 1
side2_pins = 1;     // Number of pins on side 1
side3_pins = 1;     // Number of pins on side 1
side4_pins = 1;     // Number of pins on side 1
pin_distance1 = 2.2;   // Number of pins on side 1
pin_distance2 = 0;   // Number of pins on side 2
pin_distance3 = 0;   // Number of pins on side 3
pin_distance4 = 0;   // Number of pins on side 4

pin_th = 0.2;
pin_W1 = 1.3;
pin_W2 = 0.75;
pin_W3 = 2.1;
pin_W4 = 0.75;
pin_off1 = 0;
pin_off2 = -0.75;
pin_off3 = 0;
pin_off4 = -0.75;
pin_L = 0.15;
pin_H = case_z/2+pin_th/2;
pin_l = 0.15;
pin_a = 90;

include <..\openscad\case_with_pins.scad>