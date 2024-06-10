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
            // Ajustes para que entre a presion la placa
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

module tapa() {    
    intersection() {        
        difference() {
            translate ([2,2,0])minkowski(){
                cube([placaX - 4, placaY + 1 - 4, 8], center = false); 
                cylinder(r = 2, h = 0.001, center = false, $fn = 100);
            }
            translate ([3,3,2])minkowski(){
                cube([placaX - 4 - 2, placaY + 1 - 4 - 2, 8], center = false); 
                cylinder(r = 2, h = 0.001, center = false, $fn = 100);
            }
        } 
        cube([placaX, placaY + 1, 8], center = false); 
    }
}

module tapa_display() {
    difference() {
        translate([0,placaY,2 + 0.001]) rotate([180,0,0]) translate([0,0,0]) tapa();
        translate([8 - 0.5,placaY - 8 - 15 - 1,0]) cube([62,16,2 + 0.002], center = false);
    }
}

module boton_exterior() {
    cylinder(r = 3, h = 2 + 0.002, center = false, $fn = 100); 
    translate([-2,0,0]) cube([4, 10 + 3, 2 + 0.002], center = false);  
}

module boton_interior(caption = "") {
    cylinder(r = 3 - 0.5, h = 1, center = false, $fn = 100); 
    translate([-(4 - 1)/2,0,0]) cube([4 - 1, 10 + 3, 1], center = false); 
    translate([0,0,-2]) cylinder(r = 2, h = 2, center = false, $fn = 100); 
}

module tapa_display_con_botones() {
    difference() {
        tapa_display();
        for(i=[12.5:7.5:+12.5 + 52.5]) 
            translate([i,5,0]) boton_exterior();
    }
    for(i=[12.5:7.5:+12.5 + 52.5]) 
            translate([i,5 + 0.001, 1]) boton_interior();
}

// tapon();

// caja();

tapa_display_con_botones();







