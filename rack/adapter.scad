width = 25/2 + 32 + 15.875/2;
height = 44.5 * 2; // 2U

module adapter(){    
    screw_hole_diameter = 6;
    difference() {
        // Base
        cube([width,height,5]);
        // Agujeros estandar
        translate([width - 15.875/2, 0, 0]) for (i=[0:44.50:44.50]) {
            for (j=[-screw_hole_diameter/2:screw_hole_diameter:screw_hole_diameter/2]) {
                translate([j,i + 6.35,-0.001]) cylinder(d = screw_hole_diameter, h = 5 + 0.002, center = false, $fn = 32);                
                translate([j,i + 6.35 + 15.875,-0.001]) cylinder(d = screw_hole_diameter, h = 5 + 0.002, center = false, $fn = 32);
                // Hacemos una marca para posicionar el centro de la U
                translate([15.875 / 2,i + 6.35 + 15.875,-0.001]) cylinder(d = 1.5, h = 5 + 0.002, center = false, $fn = 32);
                translate([j,i + 6.35 + 15.875 + 15.875,-0.001]) cylinder(d = screw_hole_diameter, h = 5 + 0.002, center = false, $fn = 32);
            }
            translate([-screw_hole_diameter / 2,i + 6.35 - screw_hole_diameter / 2,-0.001]) cube([screw_hole_diameter, screw_hole_diameter, 5 + 0.002], center = false);
            translate([-screw_hole_diameter / 2,i + 6.35 + 15.875 - screw_hole_diameter / 2,-0.001]) cube([screw_hole_diameter, screw_hole_diameter, 5 + 0.002], center = false);
            translate([-screw_hole_diameter / 2,i + 6.35 + 15.875 + 15.875 - screw_hole_diameter / 2,-0.001]) cube([screw_hole_diameter, screw_hole_diameter, 5 + 0.002], center = false);
        }
        translate([25/2,25 / 2,-0.001]) cylinder(d = 8, h = 5 + 0.002, center = false, $fn = 32);
        translate([25/2,height - 25 / 2,-0.001]) cylinder(d = 8, h = 5 + 0.002, center = false, $fn = 32);
        translate([25/2 - 8/2,25 / 2,-0.001]) cube([8, height - 25,5 + 0.002]);
    }
}

adapter();