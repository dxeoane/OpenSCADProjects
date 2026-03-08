include <thread.scad>

width = 5;
height = 30;
d = 20;

module base() {
    difference() {
        cylinder(h = 5, d = d + (2*width), center = false, $fn=100);
        translate([0, 0, -0.001]) cylinder(h = 5 + 0.002, d = 3, center = false, $fn=100);
    }    
    translate([0, 0, 5 - 0.001]) hfemale(d, height, width);
}

module top() {
    knob(60, 5, 6);
    translate([0, 0, 5 - 0.001]) hmale(d, 20, width, true);
}

module top2() {
    linear_extrude(height=5) import("../resources/cat.svg", dpi = 300, center = true);
    translate([0, 0, 5 - 0.001]) hmale(d, 20, width, true);
}

// base();
// translate([60, 0 ,0]) top();
// translate([0, 120 ,0]) 
top2();