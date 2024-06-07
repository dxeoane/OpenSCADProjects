// Caja para el modulo TM1638, para poder hacer un reloj de sobremesa

pared = 2;

placaX = 76;
placaY = 50;

marcoX = placaX + 1;
marcoY = placaY + 1; 

radio = 5;

module carcasa() {
    rotate([90,60,90]){
        difference() {
            minkowski() {
                rotate_extrude(angle=60, $fn= 100) {
                    square([marcoY, marcoX], center = false);
                }
                sphere(radio, $fn= 100);
            }
            rotate_extrude(angle=60, $fn= 100) {
                square([marcoY, marcoX], center = false);
            }
        }
    }
}

module caja(){
    difference(){
        union() {
            difference() {
                carcasa();
                // Recortamos el hueco del marco
                cube([marcoX, marcoY, 5 + 0.001], center = false);
            }
            translate([-0.5,0.5,-2 + 0.001]) cube([marcoX + 1, marcoY + 1, 2], center = false);
            // Tapon - exterior
            translate([marcoX - 10,37,-45]) rotate([30,0,0]) cylinder(r = 8, h = 10, $fn = 100);
            for(i=[marcoX / 5:marcoX / 5:marcoX - (marcoX / 5)]) 
                translate([i,0,0]) cylinder(r = 0.8, h = 5, $fn = 100);
            for(i=[marcoX / 5:marcoX / 5:marcoX - (marcoX / 5)]) 
                translate([i,marcoY,0]) cylinder(r = 0.8, h = 5, $fn = 100);
        }
        // Recorte del marco
        translate([0,8,-2 ]) cube([marcoX - 8, marcoY - 16, 2 + 0.002], center = false);
        // Tapon - interior
        translate([marcoX - 10,37,-45 - 0.001]) rotate([30,0,0]) cylinder(r = 6, h = 10 + 0.002, $fn = 100);    
    }
}

module tapon(){
    difference(){
        union(){
            cylinder(r = 6, h = 10 + 2, center = false, $fn = 100);
            cylinder(r = 8, h = 2, center = false, $fn = 100);  
            translate([0,0,10 + 2]) cylinder(r1 = 6 + 0.2, r2 = 4 , h = 4, center = false, $fn = 100);               
        }   
        translate([0,0,-0.001]) cylinder(d= 3.5, h = 20, center = false, $fn = 100);
        cube([40,0.2,40], center = true);
    }
}

// tapon();

caja();




