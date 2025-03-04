// Internal diameter
diameter = 66;

// Height
height = 20;

module cap(r, h, w, fn = 32) {
    extRadius = r + w;
    difference() {
        cylinder(r = extRadius, h = h, center = true, $fn = fn);
        for (i = [0:10:360]) translate([0, 0, (-h / 2) + w]) rotate([0, 0, i]) cube([1, extRadius + 1, h], center = false);
        translate([0, 0, w]) cylinder(r1 = 0, r2 = extRadius, h = h + 0.01 - (2*w), center = true, $fn = fn);
        cylinder(r = r, h = h - (2*w), center = true, $fn = fn);
    }  
}

// Cap (r is the inner radius, h is the height, w is the wall thickness)
cap(r = diameter, h = height, w = 2, fn = 100);