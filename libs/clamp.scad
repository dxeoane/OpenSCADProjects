module clamp(clampHeight, clampRadius, lockAngle = 0) {
    outerClampRadius = clampRadius + 2;
    // Screw and nut diameter
    screwRadius = 2;
    nutRadius = 4;
    nutHeight = 3;
    // Lock parameters
    lockWidth = 10;
    lockLength = 20;  
    difference() { 
        rotate([0, 0, lockAngle]) union() {
                cylinder(h = clampHeight, r = outerClampRadius, center = true, $fn = 200);
                translate([(lockLength / 2) + clampRadius, 0, 0]) cube([lockLength, lockWidth, clampHeight], center = true);
                translate([(lockLength / 2) + clampRadius, 0, 0]) cube([lockLength, lockWidth, clampHeight], center = true);
                translate([outerClampRadius + (nutRadius * 2), 0, 0]) rotate([90, 0, 0])  cylinder(h = lockWidth + (2 * nutHeight), r = 2 * nutRadius, center = true, $fn = 200);  
            }
        cylinder(h = clampHeight + 2, r = clampRadius, center = true, $fn = 200);
        rotate([0, 0, lockAngle]) union() {
            translate([(lockLength / 2) + clampRadius, 0.5, 0]) cube([lockLength + 0.05, 1, clampHeight + 2], center = true);
            translate([outerClampRadius + (nutRadius * 2), 0, 0]) rotate([90, 0, 0]) cylinder(h= lockWidth + 2, r = screwRadius, center = true, $fn = 200);
            translate([outerClampRadius + (nutRadius * 2), (lockWidth / 2) + (nutHeight / 2), 0]) rotate([90, 0, 0]) cylinder(h= nutHeight + 0.01, r = nutRadius, center = true, $fn = 6);
            translate([outerClampRadius + (nutRadius * 2), -((lockWidth / 2) + (nutHeight / 2)), 0]) rotate([90, 0, 0]) cylinder(h= nutHeight + 0.01, r = nutRadius, center = true, $fn = 6);
        }
    }
}

// Ejemplo
// clamp(clampHeight = 20, clampRadius = 16.2, lockAngle = 0);