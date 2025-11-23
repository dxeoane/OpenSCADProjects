include <../libs/spiral.scad>;


module male(d,h,t,w){
    difference(){
        union() {
            cylinder(h = h, d = d, $fn=100);
            intersection(){
                spiral(diameter = d, height = h, width = w, turns = t, segments = 100);
                cylinder(h = h, d = d + 2 * w, $fn=100);
            }
        }        
        translate([0, 0, -0.001]) cylinder(h = h + 0.002, d = d - w, $fn=100);           
    }
}

module female(d,h,t,w){
    difference(){
        cylinder(h = h, d = d + 2 * w, $fn=100);  
        translate([0, 0, -0.001]) cylinder(h = h + 0.002, d = d + w + 0.2, $fn=100);           
    }
    intersection(){
        spiral(diameter = d + w + 0.2, height = h, width = w, turns = t, segments = 100);
        cylinder(h = h, d = d + 2 * w, $fn=100);
    } 
}

module knob(d, h, n){
    d2 = 3.14159*d/(2*n);
    difference() {
        union() {
            for (i = [0:n-1]) {
                rotate([0, 0, i * 360/n]) translate([d/2, 0, 0]) cylinder(h = h, d = d2, $fn=100);
            }
            cylinder(h = h, d = d);
        }
        for (i = [0:n-1]) {
                rotate([0, 0, (i + 0.5) * 360/n]) translate([d/2, 0, -0.001]) cylinder(h = h + 0.002, d = d2, $fn=100);
        }
    }   
}

translate([60, 0 ,0]) {
    knob(40, 5, 6);
    translate([0, 0, 5 - 0.001]) male(20, 40, 4, 5);
}

knob(40, 5, 6);
translate([0, 0, 5 - 0.001]) female(20, 40, 4, 5);
