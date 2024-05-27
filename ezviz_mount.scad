// Internal radius of the clamp
clampRadius = 16.2; // [10:0.1:20]
// Angle
lockAngle = -180; // [-180,-120,-90,-60,-30,0,30,60,90,120,180]

/* [Hidden] */ 
baseRadius = 28;
cameraRadius = 50;
outerClampRadius = clampRadius + 2;
clampHeight = 20;
baseHeight = 8;

// Lock parameters
lockWidth = 10;
lockLength = 20;  

// Screw and nut diameter
screwRadius = 2;
nutRadius = 4;
nutHeight = 3;

module mount(){
    difference(){
        union(){
            // Clamp
            rotate([0, 0, lockAngle]) union() {
                cylinder(h = clampHeight, r = outerClampRadius, center = true, $fn = 200);
                translate([(lockLength / 2) + clampRadius, 0, 0]) cube([lockLength, lockWidth, clampHeight], center = true);
                translate([(lockLength / 2) + clampRadius, 0, 0]) cube([lockLength, lockWidth, clampHeight], center = true);
                translate([outerClampRadius + (nutRadius * 2), 0, 0]) rotate([90, 0, 0])  cylinder(h = lockWidth + (2 * nutHeight), r = 2 * nutRadius, center = true, $fn = 200);  
            }
            // Union
            translate([-((cameraRadius + 2 - 20) / 2) - clampRadius,2.6,0]) cube([cameraRadius + 2 - 20, 5,clampHeight], center = true);                         
            // Base
            translate([-(cameraRadius + outerClampRadius),0,(clampHeight - baseHeight) / 2]) cylinder(h = baseHeight, r = baseRadius, $fn = 100, center = true);
        }
        // Clamp holes
        cylinder(h = clampHeight + 2, r = clampRadius, center = true, $fn = 200);
        rotate([0, 0, lockAngle]) union() {
            translate([(lockLength / 2) + clampRadius, 0.5, 0]) cube([lockLength + 0.05, 1, clampHeight + 2], center = true);
            translate([outerClampRadius + (nutRadius * 2), 0, 0]) rotate([90, 0, 0]) cylinder(h= lockWidth + 2, r = screwRadius, center = true, $fn = 200);
            translate([outerClampRadius + (nutRadius * 2), (lockWidth / 2) + (nutHeight / 2), 0]) rotate([90, 0, 0]) cylinder(h= nutHeight + 0.01, r = nutRadius, center = true, $fn = 6);
            translate([outerClampRadius + (nutRadius * 2), -((lockWidth / 2) + (nutHeight / 2)), 0]) rotate([90, 0, 0]) cylinder(h= nutHeight + 0.01, r = nutRadius, center = true, $fn = 6);
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