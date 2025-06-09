module anclaje(){
    difference(){
        cylinder(d = 37.6, h = 20, center = false, $fn=200);
        translate([0,0,3]) cylinder(d = 31, h = 20, center = false, $fn=200);
        translate([0,0,-1]) cylinder(d = 20, h = 20, center = false, $fn=200);
    }
}

anclaje();