module holder(){
    difference() {
        translate([-40/2,0,0]) cube([40, 60, 20]);
        translate([0,60 - 32/2 - 10,-0.001]) cylinder(d = 31.5, h = 20 + 0.002, center = false, $fn= 200);

        translate([0,60 ,0]) cube([10, 60, 50], center = true);

        translate([0,-0.001,20/2]) rotate([-90,0,0]) cylinder(d = 4, h = 30, center = false, $fn= 200);
        translate([0,10,20/2]) rotate([-90,0,0]) cylinder(d = 8, h = 30, center = false, $fn= 200);

        translate([0,60 - 6,20/2]) rotate([0,90,0]) cylinder(d = 4 + 0.5, h = 60 + 0.002, center = true, $fn= 200);
        translate([15,60 - 6,20/2]) rotate([0,90,0]) cylinder(d = 8 + 0.2, h = 30, center = false, $fn= 200);
        translate([-30 -15,60 - 6,20/2]) rotate([0,90,0]) cylinder(d = 8 + 0.2, h = 30, center = false, $fn= 6);
    }
}

holder();