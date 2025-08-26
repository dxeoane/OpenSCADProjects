include <../libs/honeycomb.scad>;

difference() {
    cube([175,75,2]);
    translate([-0.001,-0.001,-0.001]) cube([15,15,2 + 0.002]);
    translate([-0.001,75 + 0.001 - 15,-0.001]) cube([15,15,2 + 0.002]);
    translate([175 + 0.001 - 15,-0.001,-0.001]) cube([15,15,2 + 0.002]);
    translate([175 + 0.001 - 15,75 + 0.001 - 15,-0.001]) cube([15,15,2 + 0.002]);
    translate([20,10 - 1,- 0.001]) {
        honeycomb(2.5, 2, 37, 14, 2 + 0.002);
    }
}
translate([30,5,0]) cylinder(r = 3, h = 15, center = false, $fn=200);
translate([175 - 30,5,0]) cylinder(r = 3, h = 15, center = false, $fn=200);
translate([30,75 - 5,0]) cylinder(r = 3, h = 15, center = false, $fn=200);
translate([175 - 30,75 - 5,0]) cylinder(r = 3, h = 15, center = false, $fn=200);