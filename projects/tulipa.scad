module base() {
    difference(){
        union() {
            difference(){
                cylinder(d = 120, h = 20, center = false, $fn=200);
                translate([0,0,2]) cylinder(d = 120 - 4, h = 20, center = false, $fn=200);
            } 
            cylinder(d = 52, h = 20, center = false, $fn=200);
        }
        translate([0,0,-0.001]) cylinder(d = 52 - 4, h = 20 + 0.002, center = false, $fn=200);
    }      
}

base();