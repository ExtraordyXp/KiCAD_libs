// Can be 00105,0201,0402,0603,0805,1206,1210,2010 or 2512
type="0603";

th = 0.05;

th = type=="00105" ? 0.02:
    type=="0201" ? 0.03:
    type=="0402" ? 0.04: 0.05;

l = type=="00105" ? 0.4:
    type=="0201" ? 0.6:
    type=="0402" ? 1.0:
    type=="0603" ? 1.6:
    type=="0805" ? 2.0 :
	type=="1206" ? 3.1:
	type=="1210" ? 3.2:
	type=="2010" ? 5.0:
	type=="2512" ? 6.35: 0;

w = type=="00105" ? 0.2:
    type=="0201" ? 0.3:
    type=="0402" ? 0.5:
    type=="0603" ? 0.8:
    type=="0805" ? 1.25 :
	type=="1206" ? 1.55:
	type=="1210" ? 2.6:
	type=="2010" ? 2.5:
	type=="2512" ? 3.2: 0;

t = type=="00105" ? 0.13:
    type=="0201" ? 0.23:
    type=="0402" ? 0.35:
    type=="0603" ? 0.45:
    type=="0805" ? 0.5 :
	type=="1206" ? 0.55:
	type=="1210" ? 0.55:
	type=="2010" ? 0.55:
	type=="2512" ? 0.55: 0;

d1 = type=="00105" ? 0.1:
    type=="0201" ? 0.15:
    type=="0402" ? 0.20:
    type=="0603" ? 0.30:
    type=="0805" ? 0.35:
	type=="1206" ? 0.50:
	type=="1210" ? 0.50:
	type=="2010" ? 0.60:
	type=="2512" ? 0.60: 0;

d2 = type=="00105" ? 0.1:
    type=="0201" ? 0.15:
    type=="0402" ? 0.20:
    type=="0603" ? 0.30:
    type=="0805" ? 0.40:
	type=="1206" ? 0.50:
	type=="1210" ? 0.50:
	type=="2010" ? 0.50:
	type=="2512" ? 0.50: 0;

module pin()
{
	rotate([90,0,0])
		linear_extrude(height = w, center = true, convexity = 10, twist = 0)
			polygon([[0,0],[d2,0],[d2,th],[th,th],[th,t-th],[d1,t-th],[d1,t],[0,t]]);
}


pin();
translate([l,0,0])
mirror([1,0,0])
pin();

translate([th,-(w-th)/2,th])
cube([l-th*2,w-th,t-th*2]);

translate([l/2,0,t+th])
linear_extrude(height = t/2, center = true, convexity = 10, scale=[0.8,0.9], $fn=100)    
    polygon(points=[[-l/2+d1,-w/2+th/2],[l/2-d1,-w/2+th/2],[l/2-d1,w/2-th/2],[-l/2+d1,w/2-th/2]], paths=[[0,1,2,3,4]]);
