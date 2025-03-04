module esquina() {
    difference() {
        cube([50, 50, 13 + 2]);
        translate([24 + 2, 24 + 2, -0.001]) cube([50, 50, 13 + 2 + 0.002]);
        translate([2, 2, 2]) cube([50, 50, 13 + 2]);
    }
  
}

module esquina2() {
    difference() {
        cube([50, 50, 13 + 2]);
        translate([24 + 2, 24 + 2, -0.001]) cube([50, 50, 13 + 2 + 0.002]);
        translate([0,-0.001,2]) cube([50 + 0.001, 24, 13 + 2]);
        translate([-0.001,0,2]) cube([24, 50 + 0.001, 13 + 2]);
    }
  
}

esquina2();