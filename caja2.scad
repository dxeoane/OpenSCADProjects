
module caja(x, y, z, r, fn = 32) {
    difference(){
        minkowski(){
            cube([x - 2*r, y - 2*r, z - r], center = true);
            cylinder(h = r, r1 = r/2, r2 = r, center = true, $fn = fn);    
        }
        translate([0,0,r/2]) cube([x - 2*r, y - 2*r, z - r + 0.001], center = true);
    }
    for (i=[-1:2:1]) for (j=[-1:2:1]) translate([i*(2*r-x)/2,j*(2*r-y)/2,r/2]) cylinder(r = r, h = z - r, center = true, $fn = fn);    
}

module cajaMacho(x, y, z, r, fn = 32) {
    union(){
        caja(x, y, z, r, fn);
        for (i=[-1:2:1]) for (j=[-1:2:1]) translate([i*(2*r-x)/2,j*(2*r-y)/2,(z - r)/2]) cylinder(r = r / 2, h = z - r + 0.001, center = true, $fn = fn); 
    }
}

module cajaHembra(x, y, z, r, fn = 32) {
    difference(){
        caja(x, y, z, r, fn);
        for (i=[-1:2:1]) for (j=[-1:2:1]) translate([i*(2*r-x)/2,j*(2*r-y)/2,r/2]) cylinder(r = 0.05 + r / 2, h = z - r + 0.001, center = true, $fn = fn);  
        // Rebaje para abrir mejor
        for (i=[1:-2:-1]) translate([i*(x/2 + r/4 + 0.001),0,(z/2)-0.5]) cube([r/2, 5, 1.002], center = true);
    }
}

cajaMacho(40, 20, 10, 2, fn = 100);
translate([90, 0, 0]) 
 cajaHembra(40, 20, 10, 2, fn = 100);