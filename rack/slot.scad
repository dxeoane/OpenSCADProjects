module slot() {
    screw_hole_diameter = 6;
    x = (254 / 2) - 16 - 15 - 0.4;
    y = 43.5 - 10 - 0.4;
    z = 10;
    ox = 16 + 5;
    oy = 5;

    difference() {
        union() {
            cube([x + ox, 12, 5]);
            translate([ox, oy, 0])  cube([x, y, z]);
        }

        translate([15.875/2, -0.5, 0]) {
            for (j=[-screw_hole_diameter/2:screw_hole_diameter:screw_hole_diameter/2]) {
                translate([j,6.35,-0.001]) cylinder(d = screw_hole_diameter, h = 5 + 0.002, center = false, $fn = 32);                
            }
            translate([-screw_hole_diameter / 2,6.35 - screw_hole_diameter / 2,-0.001]) cube([screw_hole_diameter, screw_hole_diameter, 5 + 0.002], center = false);
        }

        translate([ox + 2, oy + 2, 2])  cube([x - 4, y - 4, z]);
    }
}

module nut() {
    difference() {
        union() {
            cube([16, 43.5, 3]);
            cube([16, 43.5 / 3 - 3, 10]);
        }
        translate([15.875 / 2, -0.5, 0]) {
            for (j = [-6 / 2, 6 / 2]) {
                translate([j, 6.35 + 15.875, -0.001]) cylinder(d = 6, h = 5 + 0.002, $fn = 32);
                translate([j, 6.35 + 15.875 * 2, -0.001]) cylinder(d = 6, h = 5 + 0.002, $fn = 32);
            }
            translate([0, 6.35, -0.001]) {
                cylinder(d = 4.5, h = 10 + 0.002, $fn = 200);
                translate([0, 0, 5]) cylinder(d = 8, h = 10, $fn = 6);
            }
            for (j = [15.875, 15.875 * 2]) {
                translate([-6 / 2, 6.35 + j - 6 / 2, -0.001]) 
                    cube([6, 6, 5 + 0.002], center = false);
            }
        }
    }
}

module knob() {
    difference() {
        union() {
            cylinder(d = 16, h = 16, $fn = 200);
            cylinder(d = 32, h = 6, $fn = 200);
            for (i = [30:30:360]) {
                rotate([0, 0, i]) translate([0, 16, 0]) cylinder(d = 6, h = 6, $fn = 200);
            }
        }
        translate([0, 0, -0.001]) cylinder(d = 4.8, h = 16.002, $fn = 200);
        translate([0, 0, -0.001]) cylinder(d = 8, h = 10, $fn = 6);
    }
}



slot();
//nut();
//translate([0,-30,0])knob();