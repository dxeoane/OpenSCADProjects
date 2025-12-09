CaliperWidth = 16;

module radius(){
    w = CaliperWidth + 0.2; // Tolerancia
    translate([0,0,-10 + 3]) {
        difference(){
            translate([-40,-(w + 6)/2,0]) cube([40,w + 6,10],center=false);
            translate([-40 - 0.001,-w/2,-3]) cube([40 + 0.002, w, 10],center=false);
        }
        translate([0,-(w + 6)/2,0]) cube([3,6,10],center=false);
        translate([0,(w + 6)/2-6,0]) cube([3,6,10],center=false);
    }
    rotate([0,0,45]) cube([100,(w + 6)/2,3],center=false);
    rotate([0,0,-45]) translate([0,-(w + 6)/2,0]) cube([100,(w + 6)/2,3],center=false);        
}

radius();