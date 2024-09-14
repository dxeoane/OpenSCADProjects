module pie() {
    difference(){
        cylinder(d = 150, h = 10, center = false, $fn = 100);
        translate([68/2,0,3.1]) cylinder(d = 6.6, h = 7, center = false, $fn = 100);
        translate([-68/2,0,3.1]) cylinder(d = 6.6, h = 7, center = false, $fn = 100);
    }
}

module pie2() {
    difference(){
        cylinder(d = 150, h = 10, center = false, $fn = 100);
        translate([0,0,2]) cylinder(d = 146, h = 10, center = false, $fn = 100);
        translate([68/2,0,-0.001]) cylinder(d = 6.6, h = 5, center = false, $fn = 100);
        translate([-68/2,0,-0.001]) cylinder(d = 6.6, h = 5, center = false, $fn = 100);
    }
}

module pie3() {
    difference(){
        translate([2,2,5]) cube([100, 50, 10], center = true);
        translate([2,2,7]) cube([96, 46, 10], center = true);
        translate([68/2,0,-0.001]) cylinder(d = 6.6, h = 5, center = false, $fn = 100);
        translate([-68/2,0,-0.001]) cylinder(d = 6.6, h = 5, center = false, $fn = 100);
    }
}

pie3();