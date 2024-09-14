


module cone(macho) {
  difference(){
    cylinder(d1 = 90, d2 = 60, h = 30, $fn = 200);

    // Eje
    translate([0,0,-1]) cylinder(d = 10, h = 32, $fn = 200);
    // Rodamiento 1
    translate([0,0,-1]) cylinder(d = 22, h = 9, $fn = 200);
    // Rodamiento 2
    translate([0,0,30-8]) cylinder(d = 22, h = 9, $fn = 200);

    // Tornillos
    for (i = [0, 120, 240]) {
        rotate([0,0,i]) {
            translate([20,0,-1]) {
                cylinder(d = 12, h = 30 - 5, $fn = 200);
                cylinder(d = 4 + 0.2, h = 32, $fn = 200);
            }
        }
    } 
    if (!macho) {
        // Guias
        for (i = [60, 180, 300]) {
            rotate([0,0,i]) {
                translate([20,0,-1])  cylinder(d = 10 + 0.2, h = 32, $fn = 200);
            }
        } 
    }
  }
  if (macho) {
        // Guias
        for (i = [60, 180, 300]) {
            rotate([0,0,i]) {
                translate([20,0,0]) cylinder(d = 10, h = 75, $fn = 200);
                translate([20,0,75]) cylinder(d1 = 10, d2 = 6, h = 5, $fn = 200);
            }
        } 
    }
}

// cone(true);

module key() {
    difference() {
        union(){
            cylinder(d = 11, h = 40, $fn = 200);
            cube([40,11,10], center = true);
        }
        translate([0,0,40 - 3 + 0.001]) cylinder(d = 8 + 0.2, h = 3, $fn = 6);
        translate([0,0,-10]) cylinder(d = 4 + 0.5, h = 50, $fn = 200);
    }
    
}

// key();
module holder() {
   difference(){
        cube([40,40,40]); 
        translate([(40-15-0.2)/2,40-26,-1]) cube([15 + 0.2,27,62]);
   } 
   translate([40-1,40/2,40/2]) rotate([0,90,0]) cylinder(d = 7.5, h = 100 + 1, $fn = 200);
   
}

module washer() {
    difference(){
        cylinder(d = 20, h = 2, $fn = 200);
        translate([0,0,-1]) cylinder(d = 9, h = 4, $fn = 200);
    }
}

washer();