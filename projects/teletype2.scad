

pared = 2;
radio = 5;
altoPanel = 30;
marcoX = 75;
marcoY = 50; 


module carcasa() {
    difference(){
        union(){
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

            // Tapon - exterior
            rotate([30,0,0]) translate([marcoX - 10,altoPanel / 2,-marcoY - radio]) cylinder(r = 8, h = 10, center = false, $fn = 100);
        }  
        // Recortamos el hueco del marco
        translate([0,0,-2]) cube([marcoX, marcoY, 22], center = false);

        // Tapon - interior
        rotate([30,0,0]) translate([marcoX - 10,altoPanel / 2, -marcoY - radio - 0.001]) cylinder(r = 6, h = 10 + 0.002, center = false, $fn = 100);
    }
}


carcasa();
// caja();
// tapa();
// tapon_cable();