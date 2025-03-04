module centerFinder() {
    difference() {
        union() {
            translate([0,-30,0]) cylinder(d = 10, h = 3, center = false, $fn = 32);
            translate([0,30,0]) cylinder(d = 10, h = 3, center = false, $fn = 32);
            translate([-5,-30,0]) cube([10,60,3], center = false);
            translate([0,1,0]) cube([150,20,3], center = false);
            translate([0,-20 - 5,0]) cube([150,20,3], center = false);
            translate([150,-5/2 + 1/2,0]) cylinder(d = 20 + 20 + 5 + 1, h = 3, center = false, $fn = 32);
        }
        // Punta
        translate([150,-5/2 + 1/2,0]) cylinder(d = 20, h = 7, center = true, $fn = 32);

        translate([0,0,-0.001]) cylinder(r1 = 1/2,  r2 = 4, h = 3 + 0.002, center = false, $fn = 32);        
        for (i=[15:10:140]) translate([i, (10 + 1)/2 + 1 + 5, -0.001]) cylinder(r1 = 1/2,  r2 = 4, h = 3 + 0.002, center = false, $fn = 32);
        for (i=[10:10:140]) translate([i, -(10 + 1)/2 - 5 - 5, -0.001]) cylinder(r1 = 1/2,  r2 = 4, h = 3 + 0.002, center = false, $fn = 32);

        // Hueco de las patas
        translate([0,-30,0]) cylinder(d = 4 + 0.1, h = 8, center = true, $fn = 32);
        translate([0,30,0]) cylinder(d = 4 + 0.1, h = 8, center = true, $fn = 32);
    }
    for (i=[50,70]) difference() {
        translate([0,i,0]) cylinder(d = 10, h = 20 - 3, center = false, $fn = 32);
        translate([0,i,-0.001]) cylinder(d = 4 + 0.1, h = 20 - 3 + 0.002, center = false, $fn = 32);
        translate([0,i,20 - 3 - 5]) cylinder(d = 8 + 0.1, h = 5 + 0.002, center = false, $fn = 6);
    }
}

centerFinder();