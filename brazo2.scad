include <joint.scad>
include <gancho.scad>

module rotula(){
    difference() { 
        union() {
            for (p=[[0,0,0],[30,0,0]]) translate(p) {
                cylinder(h = 3, r = 12, center = false, $fn=32);
                translate([0,0,3]) maleJoint(h = 5, r = 10, n = 8, base = 1);  
            }
            translate([0,-12,0]) cube([30,24,3]);
        }
        for (p=[[0,0,-0.001],[30,0,-0.001]]) translate(p) {
            cylinder(h = 12, r = 2, center = false, $fn=32);
        }
    }
}

module brazo(){
    difference() {
        union() {
            translate([0,-12,0]) cube([100,24,5]);
            for (p=[[0,0,0],[100,0,0]]) translate(p) {
                difference(){   
                    cylinder(h = 10, r = 12, center = false);
                    translate([0,0,5 - 0.1]) cylinder(h =  5 + 0.101, r = 11, center = false);
                }
                translate([0,0,5 + 0.001]) femaleJoint(h =5, r = 10, n = 8, base = 1);
            }            
        }
        // Tornillo y tuerca
        for (p=[[0,0,0],[100,0,0]]) translate(p) {
            cylinder(h =  12, r = 2, center = true, $fn = 32);
            translate([0,0,- 0.001]) cylinder(h =  3, r = 4, center = false, $fn = 6);
        }
    }
}

brazo();