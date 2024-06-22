module foot() {
     difference(){
        // Bloque principal
        union(){
            translate([-10,-10,0]) cube([35 + 10, 35 + 10, 5]);
            translate([-5,-5,0]) cube([35 + 5, 35 + 5, 24]);
            translate([-10,35/2,2.5]) cylinder(r = 10, h = 5, center = true, $fn= 32);
            translate([35/2,-10,2.5]) cylinder(r = 10, h = 5, center = true, $fn= 32);
        } 
        // Recorte de la pata
        translate([0,0,-0.001]) cube([35 + 0.001, 35 + 0.001, 24 + 0.002]);  
        // Agujeros de los tornillos de 8mm
        for (i = [0:90:90]) {
            rotate([0,0,i]) {                
                translate([35/2, 0, 25/2 + 1 - 2.5]) rotate([90,0,0]) cylinder(d = 8, h = 12, center = true, $fn= 32);
                translate([35/2, 0, 25/2 + 1 + 2.5]) rotate([90,0,0]) cylinder(d = 8, h = 12, center = true, $fn= 32);
                translate([35/2, 0, 25/2 + 1]) rotate([90,0,0]) cube([8,5,30], center = true);
            }
        }  
        // Agujeros de los tornillos de 3.5mm   
        translate([-10,35/2,0]) {
            cylinder(d = 4, h = 12, center = true, $fn= 32);  
            translate([0,0,3.5 + 0.001]) cylinder(r1 = 4/2, r2 = 8/2, h = 3, center = true, $fn= 32);  
        }    
        translate([35/2,-10,0]) {
            cylinder(d = 4, h = 12, center = true, $fn= 32);  
            translate([0,0,3.5 + 0.001]) cylinder(r1 = 4/2, r2 = 8/2, h = 3, center = true, $fn= 32);  
        }  
     }
}

module footXL() {
     difference(){
        // Bloque principal
        union(){
            translate([-10,-10,0]) cube([35 + 10, 35 + 10, 5]);
            translate([-5,-5,0]) cube([35 + 5, 35 + 5, 49]);
            translate([-10,35/2,2.5]) cylinder(r = 10, h = 5, center = true, $fn= 32);
            translate([35/2,-10,2.5]) cylinder(r = 10, h = 5, center = true, $fn= 32);
        } 
        // Recorte de la pata
        translate([0,0,-0.001]) cube([35 + 0.001, 35 + 0.001, 49 + 0.002]);  
        // Agujeros de los tornillos de 8mm
        for (i = [0:90:90]) {
            rotate([0,0,i]) {                
                translate([35/2, 0, 25/2 + 13.5 - 15]) rotate([90,0,0]) cylinder(d = 8, h = 12, center = true, $fn= 32);
                translate([35/2, 0, 25/2 + 13.5 + 15]) rotate([90,0,0]) cylinder(d = 8, h = 12, center = true, $fn= 32);
                translate([35/2, 0, 25/2 + 13.5]) rotate([90,0,0]) cube([8,30,30], center = true);
            }
        }  
        // Agujeros de los tornillos de 3.5mm   
        translate([-10,35/2,0]) {
            cylinder(d = 4, h = 12, center = true, $fn= 32);  
            translate([0,0,3.5 + 0.001]) cylinder(r1 = 4/2, r2 = 8/2, h = 3, center = true, $fn= 32);  
        }    
        translate([35/2,-10,0]) {
            cylinder(d = 4, h = 12, center = true, $fn= 32);  
            translate([0,0,3.5 + 0.001]) cylinder(r1 = 4/2, r2 = 8/2, h = 3, center = true, $fn= 32);  
        }  
     }
}

footXL();