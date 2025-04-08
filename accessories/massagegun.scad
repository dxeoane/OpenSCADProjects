module attachment() {
    difference(){
        union(){
            cylinder(d = 15.8, h = 32, center = false, $fn= 200);
            cylinder(d = 20.8, h = 10, center = false, $fn= 200);
            translate([0,0,20]) cylinder(d = 17.8, h = 10, center = false, $fn= 200);
            translate([0,0,30]) cylinder(d1 = 17.8, d2 = 16.8, h = 2, center = false, $fn= 200);
        }
        translate([0,0,-0.001]) cylinder(d = 12.8, h = 32 + 0.002, center = false, $fn= 200);
    }    
}

// Only for fun and testing
module pincho(){
    attachment();
    translate([0,0,- 20 + 0.001])cylinder(d1 = 0, d2 = 20.8, h = 20, center = false, $fn= 200);
}

pincho();