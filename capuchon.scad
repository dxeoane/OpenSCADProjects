
module capuchon(r, h, w, fn = 32) {
    radioExt = r + w;
    difference() {
        cylinder(r = radioExt, h = h, center = true, $fn = fn);
        for (i = [0:10:360]) translate([0, 0, (-h / 2) + w]) rotate([0, 0, i]) cube([1, radioExt + 1, h], center = false);
        translate([0, 0, w]) cylinder(r1 = 0, r2 = radioExt, h = h + 0.01 - (2*w), center = true, $fn = fn);
        cylinder(r = r, h = h - (2*w), center = true, $fn = fn);
    }  
}

// Capuchón (r es el radio interior, h es la altura, w es el grosor de la pared)
capuchon(r = 33, h = 20, w = 2, fn = 100);