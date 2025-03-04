pared = 2;

placaX = 71;
placaY = 47;

marcoX = 75;
marcoY = 50; 


agujerosX = 65;
agujerosY = 37;

radio = 5;

altoPanel = 30;


module carcasa() {
    rotate([90,60,90]){
        difference() {
            union () {
                minkowski() {
                    rotate_extrude(angle=60, $fn= 100) {
                        square([marcoY, marcoX], center = false);
                    }
                    sphere(radio, $fn= 100);
                }   
                // Panel
                translate([30,0,-radio]) cube([marcoY + radio - 30, altoPanel, marcoX + 2*radio], center = false);
                translate([30,-radio,0]) cube([marcoY + radio - 30, radio, marcoX], center = false);
                rotate([90,0,90]) cylinder(r = radio, h = marcoY + radio, center = false, $fn= 100);
                translate([0,0,+marcoX]) rotate([90,0,90]) cylinder(r = radio, h = marcoY + radio, center = false, $fn= 100);
            }
            rotate_extrude(angle=60, $fn= 100) {
                square([marcoY, marcoX], center = false);
            }
            // Recorte panel
            translate([-2,2,2]) cube([marcoY + radio, altoPanel - 4, marcoX - 4], center = false);
        }
    } 
    
    minkowski() {
        cube([marcoX, marcoY, 10], center = false);
        cylinder(r = radio, $fn= 100);
    }    
}

module caja(){
    agujeros = [
        [(marcoX - agujerosX) / 2, (marcoY - agujerosY) / 2],
        [(marcoX - agujerosX) / 2, (marcoY - agujerosY) / 2 + agujerosY],
        [(marcoX - agujerosX) / 2 + agujerosX, (marcoY - agujerosY) / 2],
        [(marcoX - agujerosX) / 2 + agujerosX, (marcoY - agujerosY) / 2 + agujerosY]
    ];
    difference(){
        union() {
            difference() {
                carcasa();
                // Recortamos el hueco del marco
                cube([marcoX, marcoY, 20], center = false);
            }            
            translate([-0.5,0.5,-2 + 0.001]) cube([marcoX + 1, marcoY + 1, 2], center = false);
            // Tapon - exterior
            rotate([30,0,0]) translate([marcoX - 10,altoPanel / 2,-marcoY - radio]) cylinder(r = 8, h = 10, center = false, $fn = 100);

            // Roscas - exterior
            for (p = agujeros){
                translate([p[0], p[1], -4]) cylinder(r = 2.25, h = 6, center = false, $fn = 100);      
            }
                                  
        }
        // Recorte del marco
        translate([0,10,-2 ]) cube([marcoX - 10, marcoY - 20, 2 + 0.002], center = false);
        // Tapon - interior
        rotate([30,0,0]) translate([marcoX - 10,altoPanel / 2, -marcoY - radio - 0.001]) cylinder(r = 6, h = 10 + 0.002, center = false, $fn = 100);

        // Tapon - interior
        rotate([30,0,0]) translate([15,altoPanel / 2, -marcoY - radio - 0.001]) cylinder(r = 6.6, h = 10 + 0.002, center = false, $fn = 100);
        rotate([30,0,0]) translate([35,altoPanel / 2, -marcoY - radio - 0.001]) cylinder(r = 6.6, h = 10 + 0.002, center = false, $fn = 100);

        // Roscas - interior 
        for (p = agujeros){
            translate([p[0], p[1], -5]) cylinder(d = 0.8, h = 8, center = false, $fn = 100);        
        }      
        
    }    
}

module tapon_cable(){
    difference(){
        union(){
            cylinder(r = 6, h = 10 + 2, center = false, $fn = 100);
            cylinder(r = 8, h = 2, center = false, $fn = 100);  
            translate([0,0,10 + 2]) cylinder(r1 = 6 + 0.2, r2 = 4 , h = 4, center = false, $fn = 100);               
        }   
        translate([0,0,-0.001]) cylinder(d= 4.2, h = 20, center = false, $fn = 100);
        cube([40,0.2,40], center = true);
    }
}

module tapa() {  
    difference() {
        union() {                 
            translate([radio - 0.25, radio -0.25, 0]) difference() {
                minkowski(){
                    cube([marcoX - 2* radio + 0.5, marcoY - 2 * radio + 0.5, 5], center = false); 
                    cylinder(r = radio, h = 0.001, center = false, $fn = 100);
                }
                translate ([2, 2, 2]) minkowski(){
                    cube([marcoX - 2 * radio - 4, marcoY - 2 * radio - 4, 5], center = false); 
                    cylinder(r = radio, h = 0.001, center = false, $fn = 100);
                }
            } 
            minkowski() {
                cube([marcoX, marcoY, 0.8], center = false);
                cylinder(r = radio, h = 0.001, $fn= 100);
            }
            translate([15 - radio - 1 - 1, 10 - radio - 1 - 1, 0]) cube([50 + 2 + 2, 40 + 2 + 2, 4], center = false);
        }
        translate([15 - radio - 1, 10 - radio - 1,-0.1]) cube([50 + 2, 40 + 2, 10], center = false);
    }
}

//caja();
// tapa();
tapon_cable();