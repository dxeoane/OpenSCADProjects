include <gancho.scad>;


module calibre_digital() {
    difference() {
        minkowski() {
            cube([45,15.5,15], center = true);
            sphere(3, $fn = 100);
        }
        translate([0,0,15/2 + 3/2]) cube([60,25,3], center = true);
        translate([18.5,0,0.001]) cylinder(d = 12, h = 18, center = true, $fn = 100);
        translate([18.5,0,0.001]) cylinder(d = 8, h = 30, center = true, $fn = 100);
        translate([-5,0,0]) {            
            cube([32,15.5,15 + 0.002], center = true);
            translate([-2,1.5,0]) cube([16,15.5 + 3 + 0.001,30], center = true);
        }
    }
    translate([20,-(15.5/2 + 3 - 0.001),5]) rotate([0,0,90]) ganchos(2);
}

module lupa() {
    difference() {
        minkowski() {
            rotate([90,0,0]) cylinder(d = 110, h = 20, center = true, $fn = 100);
            sphere(3, $fn = 100);
        }
        rotate([90,0,0]) cylinder(d = 110, h = 20, center = true, $fn = 100);
        translate([0,0,150/2]) cube([150,30,150], center = true);
        translate([0,1.5,0]) cube([52,20 + 3,150], center = true);
    }
    translate([20,-(10 + 3 - 0.001),-5]) rotate([0,0,90]) ganchos(2);
}

calibre_digital();
// lupa();

