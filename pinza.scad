module pinza(alto, radio) {
    radioExt = radio + 2;
    // Diametro de tornillo y tuerca
    radioTornillo = 2;
    radioTuerca = 4;
    altoTuerca = 3;
    // Parametros del cierre
    anchoCierre = 10;
    largoCierre = 40;    
    difference() { 
        union() {
            cylinder(h = alto, r = radioExt, center = true, $fn = 200);
            // Cierre        
            union () {
                translate([largoCierre / 2, 0, 0]) cube([largoCierre, anchoCierre, alto], center = true);
                translate([radioExt + (radioTuerca * 2), 0, 0]) rotate([90, 0, 0])  cylinder(h = anchoCierre + (2 * altoTuerca), r = 2 * radioTuerca, center = true, $fn = 200);                 
            }
        }         
        cylinder(h = alto + 2, r = radio, center = true, $fn = 200);
        translate([largoCierre / 2, 0, 0]) cube([largoCierre - 10, 1, alto + 2], center = true);
        translate([largoCierre / 2, 0, 0]) cube([largoCierre + 0.01, 0.2, alto + 2], center = true);
        translate([radioExt + (radioTuerca * 2), 0, 0]) rotate([90, 0, 0]) cylinder(h= anchoCierre + 2, r = radioTornillo, center = true, $fn = 200);
        translate([radioExt + (radioTuerca * 2), (anchoCierre / 2) + (altoTuerca / 2), 0]) rotate([90, 0, 0]) cylinder(h= altoTuerca + 0.01, r = radioTuerca, center = true, $fn = 6);
        translate([radioExt + (radioTuerca * 2), -((anchoCierre / 2) + (altoTuerca / 2)), 0]) rotate([90, 0, 0]) cylinder(h= altoTuerca + 0.01, r = radioTuerca, center = true, $fn = 6);
    }
}

// Ejemplo
pinza(alto = 20, radio = 16.2);