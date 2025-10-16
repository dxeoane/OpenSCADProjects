module model1() {
    difference() {
        translate([0, -10 / 2, 0]) cube([100, 10, 18]);
        for (i=[20:60:80]) {
            translate([i, 0, 18/2]) rotate([90, 0, 0]) 
                cylinder(d = 5, h= 10 + 0.002, center=true, $fn = 200);
             translate([i, -10/2, 18/2]) rotate([90, 0, 0]) 
                cylinder(d = 10, h= 10, center=true, $fn = 200);    
        }
    }
}

model1();