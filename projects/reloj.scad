pared = 2;

placaX = 76;
placaY = 50;

marcoX = placaX + 1;
marcoY = placaY + 1; 

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
            translate([4.5, 4.5, -4]) cylinder(r = 2.25, h = 6, center = false, $fn = 100);      
            translate([4.5, placaY - 4.5, -4]) cylinder(r = 2.25, h = 6, center = false, $fn = 100);    
            translate([placaX - 4.5, 4.5, -4]) cylinder(r = 2.25, h = 6, center = false, $fn = 100);      
            translate([placaX - 4.5,placaY - 4.5, -4]) cylinder(r = 2.25, h = 6, center = false, $fn = 100);                         
        }
        // Recorte del marco
        translate([0,10,-2 ]) cube([marcoX - 10, marcoY - 20, 2 + 0.002], center = false);
        // Tapon - interior
        rotate([30,0,0]) translate([marcoX - 10,altoPanel / 2, -marcoY - radio - 0.001]) cylinder(r = 6, h = 10 + 0.002, center = false, $fn = 100);
        // Conector - interior
        rotate([30,0,0]) translate([marcoX - 40,altoPanel / 2, -marcoY - radio - 0.001]) cylinder(d = 19, h = 10 + 0.002, center = false, $fn = 100);
        // Roscas - interior
        translate([4.5, 4.5, -5]) cylinder(r = 1.25, h = 8, center = false, $fn = 100);      
        translate([4.5,placaY - 4.5,-5]) cylinder(r = 1.25, h = 8, center = false, $fn = 100);    
        translate([placaX - 4.5,4.5,-5]) cylinder(r = 1.25, h = 8, center = false, $fn = 100);      
        translate([placaX - 4.5,placaY - 4.5,-5]) cylinder(r = 1.25, h = 8, center = false, $fn = 100);      
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
    union() {  
        intersection() {        
            difference() {
                translate ([2,2,0]) minkowski(){
                    cube([placaX - 4, placaY + 1 - 4, 8], center = false); 
                    cylinder(r = 2, h = 0.001, center = false, $fn = 100);
                }
                translate ([3,3,2]) minkowski(){
                    cube([placaX - 4 - 2, placaY + 1 - 4 - 2, 8], center = false); 
                    cylinder(r = 2, h = 0.001, center = false, $fn = 100);
                }
            } 
            cube([placaX, placaY + 1, 8], center = false); 
        }
         minkowski() {
            cube([marcoX, marcoY, 0.8], center = false);
            cylinder(r = radio, h = 0.001, $fn= 100);
        }
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
    translate([0,0,-3]) cylinder(r = 2, h = 3, center = false, $fn = 100); 
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

module tapa_display_con_botones_y_tornillos() {
    difference() {
        union() {
            tapa_display_con_botones();
            translate([4.5,4.5 - 1,-6]) cylinder(r = 4, h = 8, center = false, $fn = 100);      
            translate([4.5,placaY - 4.5,-6]) cylinder(r = 4, h = 8, center = false, $fn = 100);    
            translate([placaX - 4.5,4.5 - 1,-6]) cylinder(r = 4, h = 8, center = false, $fn = 100);      
            translate([placaX - 4.5,placaY - 4.5,-6]) cylinder(r = 4, h = 8, center = false, $fn = 100);  

            for (i = [1:1:8]) translate([4.5 + 7.5 * i, placaY - 4.5,-6]) cylinder(r = 2.8, h = 8, center = false, $fn = 100);  
        }

        translate([4.5,4.5 - 1,-4]) cylinder(r = 3.5, h = 8, center = false, $fn = 100);      
        translate([4.5,placaY - 4.5,-4]) cylinder(r = 3.5, h = 8, center = false, $fn = 100);    
        translate([placaX - 4.5,4.5 - 1,-4]) cylinder(r = 3.5, h = 8, center = false, $fn = 100);      
        translate([placaX - 4.5,placaY - 4.5,-4]) cylinder(r = 3.5, h = 8, center = false, $fn = 100);  

        translate([4.5,4.5 - 1,-7]) cylinder(r = 2, h = 8, center = false, $fn = 100);      
        translate([4.5,placaY - 4.5,-7]) cylinder(r = 2, h = 8, center = false, $fn = 100);    
        translate([placaX - 4.5,4.5 - 1,-7]) cylinder(r = 2, h = 8, center = false, $fn = 100);      
        translate([placaX - 4.5,placaY - 4.5,-7]) cylinder(r = 2, h = 8, center = false, $fn = 100);  

        for (i = [1:1:8]) translate([4.5 + 7.5 * i, placaY - 4.5,-7 - 0.001]) cylinder(r = 2, h = 8, center = false, $fn = 100);  
        for (i = [1:1:8]) translate([4.5 + 7.5 * i, placaY - 4.5,-4 - 0.001]) cylinder(r = 1, h = 8, center = false, $fn = 100);  
    }
}

module tamponcillos(){
    difference(){
        cylinder(r = 3.3, h = 3, center = false, $fn = 100);
        translate([0,0,0.4]) cylinder(r = 2.3, h = 3, center = false, $fn = 100);
    }
}

 // caja();
// carcasa();
tapa_display_con_botones_y_tornillos();
// tapa();
// tapon_cable();
// tamponcillos();
