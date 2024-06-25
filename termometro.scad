include <gancho.scad>

module caja(){
    difference(){
        cube([46,33,46]);
        translate([1,1,1]) cube([44,15,46]);
        translate([5,3,1]) cube([36,15,46]);
        translate([5,-3,1]) cube([36,15,46]);
        translate([1,17,-1]) cube([44,15,50]);
        translate([-5,17,5]) cube([54,15,35]);
    }
    translate([46/2,33,46 - 3]) rotate([0,0,-90]) ganchos(1);
    translate([46/2,36,46- 40]) rotate([90,0,0]) cylinder(d = 4, h= 6, center = true, $fn = 32);
}

caja();
