use <..\openscad\case.scad>
use <..\openscad\pin.scad>

case_z = 1.6;
case_x = 6.5;
case_y = 3.5;

case_a1t = 75;  // Side1 top angle
case_a1b = 75;  // Side1 bottom angle
case_a2t = 75;  // Side2 top angle
case_a2b = 75;  // Side2 bottom angle
case_a3t = 75;  // Side3 top angle
case_a3b = 75;  // Side3 bottom angle
case_a4t = 75;  // Side4 top angle
case_a4b = 75;  // Side4 bottom angle

notch_d=0;          // Notch diameter
notch_depth=0.1;    // Notch depth
notch_x=0.8;        // Notch offset X
notch_y=0.8;        // Notch offset Y

side1_pins = 3;
side2_pins = 0;
side3_pins = 1;
side4_pins = 0;
pin_distance1 = 2.3;
pin_distance2 = 0;
pin_distance3 = 1;
pin_distance4 = 0;

pin_th = 0.28;
pin_W1 = 0.7;
pin_W2 = 0;
pin_W3 = 3;
pin_W4 = 0;
pin_off1 = 0;
pin_off2 = 0;
pin_off3 = 0;
pin_off4 = 0;
pin_L = 1.75;
pin_H = case_z/2+pin_th/2;
pin_l = 0.7;
pin_a = 125;

include <..\openscad\case_with_pins.scad>