include <gancho.scad>

h = 80;

for (i=[0:5]) {
    translate([i*21,0,0]) difference() {
        cube([22,52, h], center = false);
        translate([1,1,1]) cube([20,50, h], center = false);
    }
}

translate([40 * 2 + (6*21 - 40*2)/2, 0.001, h-10]) rotate([0,0,90]) ganchos(3);
