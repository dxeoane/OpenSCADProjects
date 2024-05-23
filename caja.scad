
module bordeVertical(r, largo, fn = 100) {
    translate([r, r, r]) sphere(r = r, $fn = fn);
    translate([r, r, r]) cylinder(r = r, h = largo - r, $fn = fn);
}

module bordeHorizontal(r, largo, fn = 100) {
    translate([r, r, r]) sphere(r = r, $fn = fn);
    translate([r, r, r]) cylinder(r = r, h = largo - (2*r), $fn = fn);
    translate([r, r, largo - r]) sphere(r = r, $fn = fn);
}

module enganches(x, y, z, r1, r2, fn = 100) {
    translate([r1, r1, r1]) cylinder(r = r2, h = z, $fn = fn);
    translate([x - r1, r1, r1]) cylinder(r = r2, h = z, $fn = fn);
    translate([r1, y - r1, r1]) cylinder(r = r2, h = z, $fn = fn);
    translate([x - r1, y - r1, r1]) cylinder(r = r2, h = z, $fn = fn);
}

module caja(x, y, z, r, fn = 100) {  
    d = r * 2;
    difference() {
        union() {            
            translate([0, r, r]) cube([x, y - d, z - r]);
            translate([r, r, 0]) cube([x - d, y - d, z]);
            translate([r, 0, r]) cube([x - d, y, z - r]);

            translate([0, 0, d]) rotate([0, 90, 0]) bordeHorizontal(r, x, fn);
            translate([0, y - d, d]) rotate([0, 90, 0]) bordeHorizontal(r, x, fn);

            translate([0, y, 0]) rotate([90, 0, 0]) bordeHorizontal(r, y, fn);
            translate([x - d, y, 0]) rotate([90, 0, 0]) bordeHorizontal(r, y, fn);
        }       
        translate([r,r,r]) cube([x - (2*r), y - (2*r), z - r + 0.01]);   
    }
    bordeVertical(r, z, fn);
    translate([x - d, 0, 0]) bordeVertical(r, z, fn);
    translate([0, y - d, 0]) bordeVertical(r, z, fn);
    translate([x - d, y - d, 0]) bordeVertical(r, z, fn);    
}

// Ejemplo de uso
translate([80, 0, 0]) union() {
    caja(60, 40, 10, 2, 32);
    enganches(60, 40, 10, 2, 1, 32);
}

difference() {
    caja(60, 40, 10, 2, 32);
    enganches(60, 40, 10, 2, 1.05, 32);
}
