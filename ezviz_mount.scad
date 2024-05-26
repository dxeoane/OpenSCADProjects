// Internal radius of the clamp
clampRadius = 16.2; // [10:0.1:20]

/* [Hidden] */ 
baseRadius = 28;
cameraRadius = 50;
outerClampRadius = clampRadius + 2;
clampHeight = 20;
baseHeight = 8;

// Screw and nut diameter
screwRadius = 2;
nutRadius = 4;
nutHeight = 3;

module clamp() {
    outerRadius = clampRadius + 2;
    // Lock parameters
    lockWidth = 10;
    lockLength = 40;    
    difference() { 
        union() {
            cylinder(h = clampHeight, r = outerRadius, center = true, $fn = 200);
            // Lock        
            union () {
                translate([lockLength / 2, 0, 0]) cube([lockLength, lockWidth, clampHeight], center = true);
                translate([outerRadius + (nutRadius * 2), 0, 0]) rotate([90, 0, 0])  cylinder(h = lockWidth + (2 * nutHeight), r = 2 * nutRadius, center = true, $fn = 200);                 
            }
        }         
        cylinder(h = clampHeight + 2, r = clampRadius, center = true, $fn = 200);
        translate([lockLength / 2, 0, 0]) cube([lockLength - 10, 1, clampHeight + 2], center = true);
        translate([lockLength / 2, 0, 0]) cube([lockLength + 0.01, 0.2, clampHeight + 2], center = true);
        translate([outerRadius + (nutRadius * 2), 0, 0]) rotate([90, 0, 0]) cylinder(h= lockWidth + 2, r = screwRadius, center = true, $fn = 200);
        translate([outerRadius + (nutRadius * 2), (lockWidth / 2) + (nutHeight / 2), 0]) rotate([90, 0, 0]) cylinder(h= nutHeight + 0.01, r = nutRadius, center = true, $fn = 6);
        translate([outerRadius + (nutRadius * 2), -((lockWidth / 2) + (nutHeight / 2)), 0]) rotate([90, 0, 0]) cylinder(h= nutHeight + 0.01, r = nutRadius, center = true, $fn = 6);
    }
}

module mount(){
    difference(){
        union(){
            // Clamp
            clamp();
            // Union
            translate([-((cameraRadius + 2 - 20) / 2) - clampRadius,0,0]) cube([cameraRadius + 2 - 20, 5,clampHeight], center = true); 
            // Base
            translate([-(cameraRadius + outerClampRadius),0,(clampHeight - baseHeight) / 2]) cylinder(h = baseHeight, r = baseRadius, $fn = 100, center = true);
        }
        // Screws
        translate([-(cameraRadius + outerClampRadius),0,(clampHeight + nutHeight)/ 2 - baseHeight])     
            for (i = [30:120:270]){
                rotate([0,0,i]) translate([-11,0,0]) cylinder(clampHeight + 0.002, r = screwRadius, center = true, $fn = 200); 
                rotate([0,0,i]) translate([-11,0,0]) cylinder(nutHeight + 0.002, r = nutRadius, center = true, $fn = 6); 
            }
    }
}

rotate([180,0,0]) mount();