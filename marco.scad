include <dovetail.scad>;
include <honeycomb.scad>;


module tornillo() {
    difference(){  
        cylinder(d = 15, h = 3, $fn = 100);
        translate([0,0,-0.1]) cylinder(d1 = 3.5, d2 = 8, h = 3.2, $fn = 100);
    }
}

module base() {
    difference() {
        union() {            
            cube([80,3,120]);
            cube([80,6,5]);       
            cube([5,6,120]);  
            translate([80 - 5,0,0]) cube([5,6,120]);       
        }
        intersection() {
            translate([80,10,0]) rotate([0,-90,90]) honeycomb(r1 = 10, r2 = 8, x = 9, y = 6, z = 20);
            translate([5,-10,5]) cube([70,20,110]);
        }
        translate([3,3,3]) cube([74,1,120]);
    }
    translate([40,0,105]) rotate([-90,0,0]) tornillo();
}

base();

