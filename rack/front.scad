include <../raspberry.scad>

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

module tplink(){    
    difference(){
        front();
        translate([(254/2) - 80,(43.5 - 26) / 2, 5 - 0.001]) cube([80 + 0.001,26, 5 + 0.002]);
        translate([(254/2) - 70,(43.5 - 26) / 2, -0.001]) cube([70 + 0.001,26, 5 + 0.002]);
    }
    difference(){
        union() {
            translate([(254/2) - 82, (43.5 - 30) / 2, 5]) cube([82, 30, 102]);
            translate([(254/2) - 5, 0, 5]) cube([5, 43.5, 110]);
        }
        translate([(254/2) - 80, (43.5 - 30) / 2 + 2, 5 -0.001]) cube([80 + 0.001, 26, 100 + 0.001]);        
        translate([254/2,(43.5 - 30) / 4, 20]) rotate([0,90,0]) cylinder(d = 3.05, h = 20, center = true, $fn = 32);
        translate([254/2,(43.5 - 30) / 4, 110 - 20]) rotate([0,90,0]) cylinder(d = 3.05, h = 20, center = true, $fn = 32);     
        translate([254/2,43.5 - (43.5 - 30) / 4, 20]) rotate([0,90,0]) cylinder(d = 3.05, h = 20, center = true, $fn = 32);
        translate([254/2,43.5 - (43.5 - 30) / 4, 110 - 20]) rotate([0,90,0]) cylinder(d = 3.05, h = 20, center = true, $fn = 32);     
        translate([(254/2) - 83,0,22]) cube([50,43.5,100]);
    }
}

module raspberry_front(){
    difference(){
        front2(); 
        translate([(254/2 - 16 - 60)/2 + 16,(43.5 - 24) / 2, -0.01]) {
            // Recorte para las conexiones
            cube([60,24,15 + 0.02]);  
            // Agujeros del frontal
            for (p=[[-10,-3,-0.01],[-10,20 - 3,-0.01],[60 + 10,-3,-0.01],[60 + 10,20 - 3,-0.01]]) {
                translate(p) cylinder(d= 3.25, h = 15 + 0.02, center = false, $fn = 32);
                translate(p) cylinder(d= 6.50, h = 3 + 0.02, center = false, $fn = 32);
            }     
        }
    }    
}

module prueba_raspberry(){
    raspberry_front();
    // translate([60 + 15 + 16 + (254/2 - 16 - 90) / 2,2,90 + 10]) rotate([-90,0,0]) rotate([0,0,90]) raspberry();
}

// prueba_raspberry();
front2();