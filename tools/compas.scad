module left() {
    difference() {
        union(){
                translate([60, 0, 0]) cylinder(r = 60, h = 4, center = false, $fn = 100);
                cube([10, 100, 4]);
                translate([5, 100, 0]) cylinder(r = 10, h = 4, center = false, $fn = 100);
        } 
        translate([60, 0, -0.01]) cylinder(r = 60 - 10, h = 4 + 0.02, center = false, $fn = 100);
        translate([10, 0, -0.01]) cube([2*60 + 1, 60 + 1, 4 + 0.02]);
        translate([60, 0, -0.01]) rotate([0,0,-atan(100/60)]) cube([120, 120, 4 + 0.02]);
        translate([5, 100, -0.01]) cylinder(d = 4 + 0.5, h = 4 + 0.02, center = false, $fn = 100);
        translate([90, -41, -0.01]) cylinder(r = 10, h = 4 + 0.02, center = false, $fn = 100);
    }
}

module right() {
    difference() {
        union(){
                translate([60, 0, 0]) cylinder(r = 60, h = 4, center = false, $fn = 100);
                translate([0, 0, -4]) cube([10, 100, 8]);
                translate([5, 100, -4]) cylinder(r = 20, h = 4, center = false, $fn = 100);
                translate([5, 100, -7]) cylinder(r = 8, h = 3, center = false, $fn = 100);
        } 
        translate([60, 0, -0.01]) cylinder(r = 60 - 10, h = 4 + 0.02, center = false, $fn = 100);
        translate([10, 0, -0.01]) cube([2*60 + 1, 60 + 1, 4 + 0.02]);
        translate([60, 0, -0.01]) rotate([0,0,-atan(100/60)]) cube([120, 120, 4 + 0.02]);
        translate([5, 100, -4 -0.01]) cylinder(d = 4 + 0.5, h = 4 + 0.02, center = false, $fn = 100);
        translate([5, 100, -0.01]) cylinder(r = 15, h = 4 + 0.02, center = false, $fn = 100);
        translate([90, -41, -0.01]) cylinder(r = 10, h = 4 + 0.02, center = false, $fn = 100);
        translate([5, 100, -7 - 0.001]) cylinder(r = 4, h = 3, center = false, $fn = 6);
    }
}

module left1() {
    difference() {
        union(){
                translate([60, 0, 0]) cylinder(r = 60, h = 4, center = false, $fn = 100);
                cube([10, 150, 4]);
                translate([5, 150, 0]) cylinder(r = 10, h = 4, center = false, $fn = 100);
        } 
        translate([60, 0, -0.01]) cylinder(r = 60 - 10, h = 4 + 0.02, center = false, $fn = 100);
        translate([10, 0, -0.01]) cube([2*60 + 1, 60 + 1, 4 + 0.02]);
        translate([60, 0, -0.01]) rotate([0,0,-atan(150/60)]) cube([120, 120, 4 + 0.02]);
        translate([5, 150, -0.01]) cylinder(d = 4 + 0.1, h = 4 + 0.02, center = false, $fn = 100);
        translate([80, -45, -0.01]) cylinder(r = 10, h = 4 + 0.02, center = false, $fn = 100);
    }
}

right();