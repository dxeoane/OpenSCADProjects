include <clamp.scad>

difference() {
    clamp(30, 11, 0);
    translate([-11 -2.5,-11,0]) rotate([0,90,0]) cylinder(d = 10, h = 50, center = true, $fn = 32);
    translate([-11 -2.5,11,0]) rotate([0,90,0]) cylinder(d = 10, h = 50, center = true, $fn = 32);
}
difference() {
    translate([-11 -2.5,0,0]) cube([5,42,30], center=true);
    translate([-11 -2.5,-11,0]) rotate([0,90,0]) cylinder(d = 5, h = 8, center = true, $fn = 32);
    translate([-11 -2.5,11,0]) rotate([0,90,0]) cylinder(d = 5, h = 8, center = true, $fn = 32);
}
