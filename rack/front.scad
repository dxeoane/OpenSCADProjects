// Medio frontal sin solapas
module front() {
    screw_hole_diameter = 6;
    difference(){
        union() {
            cube([254 / 2,43.5, 5]);
            translate([16, 0, 0]) cube([(254 / 2) - 16, 43.5, 10]);
        }
        translate([15.875/2, -0.5, 0]) {
            for (j=[-screw_hole_diameter/2:screw_hole_diameter:screw_hole_diameter/2]) {
                translate([j,6.35,-0.001]) cylinder(d = screw_hole_diameter, h = 5 + 0.002, center = false, $fn = 32);                
                translate([j,6.35 + 15.875,-0.001]) cylinder(d = screw_hole_diameter, h = 5 + 0.002, center = false, $fn = 32);
                translate([j,6.35 + 15.875 + 15.875,-0.001]) cylinder(d = screw_hole_diameter, h = 5 + 0.002, center = false, $fn = 32);
            }
            translate([-screw_hole_diameter / 2,6.35 - screw_hole_diameter / 2,-0.001]) cube([screw_hole_diameter, screw_hole_diameter, 5 + 0.002], center = false);
            translate([-screw_hole_diameter / 2,6.35 + 15.875 - screw_hole_diameter / 2,-0.001]) cube([screw_hole_diameter, screw_hole_diameter, 5 + 0.002], center = false);
            translate([-screw_hole_diameter / 2,6.35 + 15.875 + 15.875 - screw_hole_diameter / 2,-0.001]) cube([screw_hole_diameter, screw_hole_diameter, 5 + 0.002], center = false);
        }
    }
}

// Medio frontal con solapas
module front2() {
    union(){
        front();
        // Solapa para añadir la otra mitad del frontal
        difference() {
            translate([254/2 - 5, 0, 0]) cube([5, 43.5, 20]);
            translate([254/2, 10, 15]) rotate([0,90,0]) cylinder(d = 3.25, h = 12, center = true, $fn = 32);
            translate([254/2, 43.5 - 10, 15]) rotate([0,90,0]) cylinder(d = 3.25, h = 12, center = true, $fn = 32);
            translate([254/2 - 3 - 0.001, 10, 15]) rotate([0,90,0]) cylinder(d = 6.25, h = 4, center = true, $fn = 6);
            translate([254/2 - 3 - 0.001, 43.5 - 10, 15]) rotate([0,90,0]) cylinder(d = 6.25, h = 4, center = true, $fn = 6);
        }
    }
}