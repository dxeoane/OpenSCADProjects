proporcion = 1/15;

module base(diametro, altura, grosor){
    inc = 2 * altura * proporcion;
    difference(){
        union() {
            difference(){
                cylinder(d1 = diametro, d2 = diametro + inc, h = altura, $fn=200);    
                translate([0,0,grosor]) cylinder(d1 = diametro - 2 * grosor, d2 = (diametro - 2 * grosor) + inc, h = altura, $fn=200); 
            }       
            intersection() {
                translate([0,-diametro/2,0])  rotate([atan(proporcion),0,0]) cylinder(d=30, h=altura, $fn=200);
                cylinder(d1 = diametro, d2 = diametro + inc, h = altura, $fn=200);
            }
        }        
        translate([0,-diametro/2,0])  rotate([atan(proporcion),0,0]) translate([0,0,-1]) cylinder(d=30 - 2*grosor, h=altura + 2, $fn=200);
    }
}


module tapa(diametro, altura, grosor){  
    boca = diametro + 2 * altura * proporcion;
    boca_interno = boca - 2 * grosor;
    alto_tapa = 3;
    profundidad_cierre = 3;
    espacio = 2;
    diametro_superior = boca + 2 * alto_tapa / 15;
    diametro_interior = boca - 2 * grosor - espacio;
    diametro_inferior = diametro_interior - 2 * profundidad_cierre / 15;
    difference(){
        union() {
            difference(){
                union() {
                    cylinder(d1 = boca, d2 = diametro_superior, h = alto_tapa, $fn=200); 
                    translate([0,0,-profundidad_cierre]) cylinder(d1 = diametro_inferior, d2 = diametro_interior, h = profundidad_cierre, $fn=200); 
                }
                translate([0,0,-profundidad_cierre - 0.001]) cylinder(d = diametro_inferior - 2 * grosor, h = profundidad_cierre, $fn=200); 
            }
            intersection() {
                translate([0,-boca/2,0])  rotate([atan(proporcion),0,0]) translate([0,0,-30]) cylinder(d=30 + 2 * grosor, h = altura, $fn=200);
                union() {
                    cylinder(d1 = boca, d2 = diametro_superior, h = alto_tapa, $fn=200); 
                    translate([0,0,-profundidad_cierre]) cylinder(d1 = diametro_inferior, d2 = diametro_interior, h = profundidad_cierre, $fn=200); 
                }
            }
        }
        intersection() {
            translate([0,-boca/2,0])  rotate([atan(proporcion),0,0]) translate([0,0,-31]) cylinder(d= 30 +  1, h=altura, $fn=200);
            translate([0,0,-profundidad_cierre - 0.001]) cylinder(d = boca * 2, h = profundidad_cierre + 0.001, $fn=200); 
        }
    }
}

base(72, 60, 5);
// tapa(72, 60, 5);

// base(72, 90, 5);
// tapa(72, 90, 5);

