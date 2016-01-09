// Can be 00105,0201,0402,0603,0805,1206,1210,2010 or 2512
type="1210";

th = 0.05;

th = type=="00105" ? 0.02:
    type=="0201" ? 0.03:
    type=="0402" ? 0.04: 0.05;

L = type=="00105" ? 0.4:
    type=="0201" ? 0.6:
    type=="0402" ? 1.0:
    type=="0603" ? 1.6:
    type=="0805" ? 2.0 :
	type=="1206" ? 3.1:
	type=="1210" ? 3.2:
	type=="2010" ? 5.0:
	type=="2512" ? 6.35: 0;

W = type=="00105" ? 0.2:
    type=="0201" ? 0.3:
    type=="0402" ? 0.5:
    type=="0603" ? 0.8:
    type=="0805" ? 1.25 :
	type=="1206" ? 1.55:
	type=="1210" ? 2.6:
	type=="2010" ? 2.5:
	type=="2512" ? 3.2: 0;

T = type=="00105" ? 0.13:
    type=="0201" ? 0.23:
    type=="0402" ? 0.35:
    type=="0603" ? 0.7:
    type=="0805" ? 1.2 :
	type=="1206" ? 0.55:
	type=="1210" ? 2.0:
	type=="2010" ? 0.55:
	type=="2512" ? 0.55: 0;

t = type=="00105" ? 0.1:
    type=="0201" ? 0.15:
    type=="0402" ? 0.25:
    type=="0603" ? 0.35:
    type=="0805" ? 0.5:
	type=="1206" ? 0.50:
	type=="1210" ? 0.50:
	type=="2010" ? 0.60:
	type=="2512" ? 0.60: 0;

union()
{
	translate([0,-W/2])
		cube([t,W,T]);
	translate([L-t,-W/2])
		cube([t,W,T]);

	translate([th,-(W-th*2)/2,th])
		cube([L-th*2,W-th*2,T-th*2]);
}