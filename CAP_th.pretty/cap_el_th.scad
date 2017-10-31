$fn=20;

th = 0.2;
case_D = 10.0;
case_H = 20;
pin_D = 1;
pin_L = 2.6;
pin_distance = 5.0;

module case(_D, _H)
{
    difference()
    {
        cylinder(h = _H, r = _D/2);
        union()
        {
            translate([0,0,_H-th])
            cylinder(h = th*2, r = _D/3);
            translate([0,0,-th])
            cylinder(h = th*2, r = _D/3);
        }
    }
}

module pin(_D, _H)
{
    translate([0,0,-_H+th])
    cylinder(h = _H, r = _D/2);
}

union()
{
    case(case_D,case_H);
    translate([-pin_distance/2,0,0])
    pin(pin_D,pin_L);
    translate([+pin_distance/2,0,0])
    pin(pin_D,pin_L);
}
