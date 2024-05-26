
module bordeVertical(r, largo, fn = 100) {
    translate([r, r, r]) sphere(r = r, $fn = fn);
    translate([r, r, r]) cylinder(r = r, h = largo - r, $fn = fn);
}

module bordeHorizontal(r, largo, fn = 100) {
    translate([r, r, r]) sphere(r = r, $fn = fn);
    translate([r, r, r]) cylinder(r = r, h = largo - (2*r), $fn = fn);
    translate([r, r, largo - r]) sphere(r = r, $fn = fn);
}

module baseEnganches(x, y, z, r1, r2, n = 2, fn = 100) {
    radioExterior = r1 + r2;
    for (i = [radioExterior:(x - (2*radioExterior))/(n-1):x - radioExterior]) {
        translate([i, radioExterior, r1]) cylinder(r = radioExterior, h = z - r1, $fn = fn);    
        translate([i, y - radioExterior, r1]) cylinder(r = radioExterior, h = z - r1, $fn = fn);
    }
}

module enganches(x, y, z, r1, r2, n = 2, fn = 100) {
    radioExterior = r1 + r2;
    h = z - (2*r1);
    for (i = [radioExterior:(x - (2*radioExterior))/(n-1):x - radioExterior]) {
        translate([i, radioExterior, (h / 2) + r1]) cylinder(r = r2, h = z, $fn = fn);
        translate([i, y - radioExterior, (h / 2) + r1]) cylinder(r = r2, h = z, $fn = fn);
    }
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
        translate([r, r, r]) cube([x - (2*r), y - (2*r), z - r + 0.01]);         
    }
    bordeVertical(r, z, fn);
    translate([x - d, 0, 0]) bordeVertical(r, z, fn);
    translate([0, y - d, 0]) bordeVertical(r, z, fn);
    translate([x - d, y - d, 0]) bordeVertical(r, z, fn);    
}

module cajaMacho(x, y, z, r1, r2, n = 2, fn = 100) {  
    caja(x, y, z, r1, fn);
    baseEnganches(x, y, z, r1, r2, n, fn);
    enganches(x, y, z, r1, r2, n, fn);
}

module cajaHembra(x, y, z, r1, r2, n = 2, fn = 100) {  
    difference() {
        union() {
            caja(x, y, z, r1, fn);
            baseEnganches(x, y, z, r1, r2, n, fn);
        }
        enganches(x, y, z, r1, r2, n, fn);
        // Rebaje para ayudar a abrir la caja
        translate([x/2, y/2, z]) cube([x + 1, 5, 0.5], center = true);  
    }
}

// Ejemplo de uso
// translate([80, 0, 0]) cajaMacho(60, 40, 10, 2, 2, 4, 32);
// En la caja hembra, en los agujeros los enganches, le damos 0.1 de holgura
// cajaHembra(60, 40, 10, 2, 2.1, 4, 32);

// Caja sin enganches
// translate([0, 60, 0]) caja(60, 40, 10, 2, 32);

// Caja alta
// translate([80, 0, 0]) cajaMacho(40, 20, 30, 2, 2, 32);
// cajaHembra(40, 20, 90, 2, 2.1, 32);

// En el caso de que la caja lleve enganches el espacio interior se reduce en 16 mm, tanto en x como en y
