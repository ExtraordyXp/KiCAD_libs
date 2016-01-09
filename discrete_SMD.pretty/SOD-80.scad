ext_r=0.8;
pin_w=0.3;
case_w=3.3;
case_r=0.7;
label_w=0.3;
label_off=0.5;
label_dr=0.02;

$fn=10;

module pin()
{
	translate([0, 0, ext_r])
	mirror([0, 1, 0])
	rotate([90, 0, 0])
	cylinder(h=pin_w, r = ext_r, center= false);	
}

module case()
{
	translate([0, pin_w, ext_r])
	mirror([0, 1, 0])
	rotate([90, 0, 0])
	cylinder(h=case_w-2*pin_w, r = case_r, center= false);	
}

module label()
{
	translate([0, case_w-pin_w-label_w-label_off, ext_r])
	mirror([0, 1, 0])
	rotate([90, 0, 0])
	cylinder(h=label_w, r = case_r+label_dr, center= false);	
}

union() {
	pin();
	case();
	label();
	translate([0,case_w-pin_w,0])
	pin();	
}
