
diameter = 2 * 60;
height = 90; // - 20;

module jar() {
    difference(){
        union() {
            cylinder(d = diameter, h = height, center = false, $fn = 200);
            cylinder(d = diameter - 2, h = height + 20, center = false, $fn = 200);
        }
        translate([0,0,1])cylinder(d = diameter - 4, h = height + 20, center = false, $fn = 200);
    }
}

module lid() {
    difference(){
        cylinder(d = diameter, h = 30, center = false, $fn = 200);
        translate([0,0,1])cylinder(d = diameter + 0.2 - 2, h = 30, center = false, $fn = 200);
    }
}


module jar2() {
    difference(){
        union() {
            cylinder(d = diameter, h = height, center = false, $fn = 200);
        }
        translate([0,0,2]) cylinder(d = diameter - 4, h = height, center = false, $fn = 200);
    }
}

module lid2() {
    difference(){
        cylinder(d = diameter + 4, h = 30, center = false, $fn = 200);
        translate([0,0,2])cylinder(d = diameter + 0.2, h = 30, center = false, $fn = 200);
    }
}

jar2();
//lid2();