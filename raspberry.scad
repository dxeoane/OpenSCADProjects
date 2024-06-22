include <honeycomb.scad>

module raspberry(){   
    difference(){
        // Cuerpo sin recortar
        union() { 
            // Base 
            cube([90, 60, 5]);
            // Desplazamos todo para centrarlo en la base
            translate([2.5, 2, 0]){
                // Base de los tornillos de la placa
                for (p = [[3.5,3.5,5], [3.5,52.5,5], [61.5,3.5,5], [61.5,52.5,5]]){
                    translate(p){
                        cylinder(d= 6.2, h = 3, center = false, $fn = 32);
                    }
                }
            }
            // Pared lateral larga
            translate([0,60,0]) cube([90, 5, 20 + 5 + 5]);
            // Pared lateral corta
            translate([2.5 + 3.5 + 58 - 5, -5, 0]) cube([90 - (2.5 + 3.5 + 58 - 5), 5, 20 + 5 + 5]);
            // Base de los tornillos de la tapa
            for (p = [[2.5 + 3.5 + 58, - 5, 0], [2.5 + 3.5 + 58, 60 + 5, 0], [-5, 60 - 3.5 - 2, 0], [-5, 2 + 3.5, 0]]){
                translate(p){
                    cylinder(d= 10, h = 20 + 5 + 5, center = false, $fn = 32);
                }
            }
            // Añadidos para los tornillos de las tapas
            translate([-5,2 + 3.5 - 5,0]) cube([5,10,20 + 5 + 5]);   
            translate([-5,2 + 3.5 - 5 + 49,0]) cube([5,10 + 3.5 + 2,20 + 5 + 5]);  
            // Añadiso para los tornillos del frontal
            translate([90 - 5, -10 -5, 0]) cube([5,10,20 + 5 + 5]);
            translate([90 - 5, 60 + 5, 0]) cube([5,10,20 + 5 + 5]);
        }
        
        // Recortes

        // Agujeros de los tornillos de la placa (M2.5x8)
        translate([2.5, 2, 0]){
            // Base de los tornillos de la placa
            for (p = [[3.5,3.5,0], [3.5,52.5,0], [61.5,3.5,0], [61.5,52.5,0]]){
                translate(p){
                    translate([0,0,-0.01]) cylinder(d= 2.75, h = 5 + 3 + 0.02, center = false, $fn = 32);
                    translate([0,0,-0.01]) cylinder(d= 5, h = 5 + 0.01 - 2, center = false, $fn = 6);
                }
            }
        }
        // Agujeros de los tornillos de la tapa
        for (p = [[2.5 + 3.5 + 58, - 5, 0], [2.5 + 3.5 + 58, 60 + 5, 0], [-5, 60 - 3.5 - 2, 0], [-5, 2 + 3.5, 0]]){
            translate(p){
                translate([0,0,-0.01]) cylinder(d= 3.25, h = 20 + 5 + 5 + 0.02, center = false, $fn = 32);
                translate([0,0,-0.01]) cylinder(d= 6.25, h = 20 + 5 + 5 + 0.02 - 3, center = false, $fn = 6);
            }
        }
        // Agujeros del frontal
        for (p=[[90, -10, 5], [90, -10, 25], [90, 60 + 10, 5], [90, 60 + 10, 25]]) {
            translate(p) rotate([0,90,0]) cylinder(d= 3.25, h = 10 + 0.02, center = true, $fn = 32);
            translate([-4,0,0]) translate(p) rotate([0,90,0]) cylinder(d= 6.25, h = 2 + 0.02, center = true, $fn = 6);
        }
    }
}

module raspberry_lid(){
    difference(){
        // Cuerpo sin recortar
        union() { 
            // Base 
            cube([90, 60, 5]);
            // Pared lateral larga
            translate([0,60,0]) cube([90, 5, 5]);
            // Pared lateral corta
            translate([2.5 + 3.5 + 58 - 5, -5, 0]) cube([90 - (2.5 + 3.5 + 58 - 5), 5, 5]);
            // Base de los tornillos de la tapa
            for (p = [[2.5 + 3.5 + 58, - 5, 0], [2.5 + 3.5 + 58, 60 + 5, 0], [-5, 60 - 3.5 - 2, 0], [-5, 2 + 3.5, 0]]){
                translate(p){
                    cylinder(d= 10, h = 5, center = false, $fn = 32);
                }
            }
            // Añadidos para los tornillos de las tapas
            translate([-5,2 + 3.5 - 5,0]) cube([5,10,5]);   
            translate([-5,2 + 3.5 - 5 + 49,0]) cube([5,10 + 3.5 + 2,5]);  
        }

        // Recortes
        // Agujeros de los tornillos de la tapa
        for (p = [[2.5 + 3.5 + 58, - 5, 0], [2.5 + 3.5 + 58, 60 + 5, 0], [-5, 60 - 3.5 - 2, 0], [-5, 2 + 3.5, 0]]){
            translate(p){
                translate([0,0,-0.01]) cylinder(d= 3.25, h = 5, center = false, $fn = 32);
                translate([0,0, 2 + -0.01]) cylinder(d= 6.25, h = 5, center = false, $fn = 32);
            }
        }

        // Rejilla
        translate([5,5,-0.01]) honeycomb(r1 = 4, r2 = 3.5, x = 14, y = 9, z = 5 + 0.02);
  }
}

// raspberry();
// raspberry_lid();