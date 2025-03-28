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

module knob2() {
    difference() {
        union() {
            cylinder(d = 16, h = 16, $fn = 200);
            for (i = [30:30:360]) {
                rotate([0, 0, i]) translate([0, 8, 0]) cylinder(d = 2, h = 16, $fn = 200);
            }
        }
        translate([0, 0, -0.001]) cylinder(d = 4.8, h = 16.002, $fn = 200);
        translate([0, 0, -0.001]) cylinder(d = 8, h = 10, $fn = 6);
    }
}

module relays() {
    x = (254 / 2) - 16 - 15 - 0.4;
    HolesX = 85;
    HolesY = 80;
    HolesZ = 10;
    difference(){
        translate([x,0,0]) rotate([-90,0,0]) rotate([0,0,180]) {
            translate([-16 - 5, 43.5 - 5 - 0.4, 0]) rotate([0,0,180]) mirror([1,0,0]) slot();
            cube([x, 2, 110]);  
        }  
        translate([10,-1,5]) cube([x - 20, 30, 25]);
    }
    // Soportes de la placa
    for (p = [
        [(x - HolesX) / 2, 20, 0],
        [(x - HolesX) / 2 + HolesX, 20, 0],
        [(x - HolesX) / 2, 20 + HolesY, 0],
        [(x - HolesX) / 2 + HolesX, 20 + HolesY, 0]
    ]) translate(p) {
        difference(){
            cylinder(d = 6, h = HolesZ, center = false, $fn = 100);   
            translate([0,0,-0.001]) cylinder(d = 2, h = HolesZ + 0.002, center = false, $fn = 100);   
        }   
    }  
}

module adapter(){    
    width = 25/2 + 32 + 15.875/2;
    height = 44.5 * 2; // 2U
    screw_hole_diameter = 6;
    difference() {
        // Base
        union() {
            cube([width,height,5]);
            translate([width - 20,0,0]) cube([20, height, 10]);
        }
        // Agujeros estandar
        translate([width - 15.875/2, 0, 0]) for (i=[0:44.50:44.50]) {
            translate([0,i + 6.35,-0.001]) cylinder(d = 4 + 1, h = 20 + 0.002, center = false, $fn = 200);
            translate([0,i + 6.35 + 15.875,-0.001]) cylinder(d = screw_hole_diameter + 1, h = 20 + 0.002, center = false, $fn = 200);
            translate([0,i + 6.35 + 15.875  + 15.875,-0.001]) cylinder(d = screw_hole_diameter + 1, h = 20 + 0.002, center = false, $fn = 200);

            translate([0,i + 6.35,5]) cylinder(d = 8, h = 20 + 0.002, center = false, $fn = 6);
            translate([0,i + 6.35 + 15.875, 5]) cylinder(d = screw_hole_diameter * 2, h = 20 + 0.002, center = false, $fn = 6);
            translate([0,i + 6.35 + 15.875  + 15.875, 5]) cylinder(d = screw_hole_diameter * 2, h = 20 + 0.002, center = false, $fn = 6);
        }
        translate([25/2,25 / 2,-0.001]) cylinder(d = 8, h = 5 + 0.002, center = false, $fn = 32);
        translate([25/2,height - 25 / 2,-0.001]) cylinder(d = 8, h = 5 + 0.002, center = false, $fn = 32);
        translate([25/2 - 8/2,25 / 2,-0.001]) cube([8, height - 25,5 + 0.002]);
    }
}


// slot();
//nut();
//translate([0,-30,0])knob();
// knob2();
// relays();

mirror([1,0,0]) adapter();


