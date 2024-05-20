$fn=200;

// Altura de la tecla
height = 12;
// Ancho de la parte inferior
bottom = 18;
// Ancho de la parte superior
top = 14;
// Grosor de la tapa superior
thickness = 5;
// Si vale "true" se redondea la parte superior
rounded = true;
// Si vale "true" se hace un recorte en la parte superior para acomodar el dedo
cutOff = true;


// Está es la forma extererior de la tecla
module outterCap() {   
    bottomRad = bottom / sqrt(2); 
    topRad = top / sqrt(2);
    intersection() {
        cylinder(h = height, r1 = bottomRad, r2 = topRad, $fn=4); 
        scale([0.8, 0.8, 1]) cylinder(h = height, r1 = bottomRad, r2 = topRad, $fn=200); 
    }
}

// Esta es la forma de la tecla completa
module cap() {
    difference() {
        outterCap();
        translate([0, 0, -thickness]) outterCap();
        // Si queremos que la parte de arriba tenga un recorte para acomodar el dedo
        if (cutOff) {
            // Radio del recorte. A mayor valor, mas suave será el recorte
            r = 60;
            translate([0,0,height + r - 1]) rotate([0, 90, 135]) cylinder(h = bottom, r = r, center = true);
        }
    }
}

// Este es el poste que conecta la tecla con el interruptor
module pole() {
    h = height - thickness;
    // Tamaño en el eje X de cada una de las aspas la cruz
    crossX = 4;
    // Tamaño en el eje Y de cada una de las aspas la cruz
    crossY = 1.2;
    // Ensanche que se hace al principio de la cruz para que sea mas facil encajar la tecla en el interruptor
    crossAdjustHeight = 1;
    crossAdjustWidt = 0.3;
    difference() { 
        // El poste tiene como base un cilindro recortado por dos lados
        intersection() {
            rotate([0, 0, 45]) translate([0, 0, h / 2]) cube([6, 5 - 0.01, h], center = true);
            translate([0, 0, h / 2]) cylinder(h= h, r = 3, center = true);
        }
        // Aqui recortamos la cruz donde encaja es interrurptor
        rotate([0, 0, 45]) translate([0, 0,(h / 2) - 0.01]) cube([crossX, crossY, h], center = true);
        rotate([0, 0, 135]) translate([0, 0,(h / 2) - 0.01]) cube([crossX, crossY, h], center = true);
        // Aqui ensanchamos la boca de la cruz para que sea mas facil encajar la tecla en el interruptor
        rotate([0, 0, 45])  translate([0, 0,(crossAdjustHeight / 2) - 0.01]) cube([crossX + crossAdjustWidt, crossY + crossAdjustWidt, crossAdjustHeight], center = true);
        rotate([0, 0, 135]) translate([0, 0,(crossAdjustHeight / 2) - 0.01]) cube([crossX + crossAdjustWidt, crossY + crossAdjustWidt, crossAdjustHeight], center = true);
    }
}

if (rounded) {
    // Si lo queremos redondeado, la dejamos colocada como está y la redondeamos
    intersection() {
        union() {
            cap();
            pole();
        }
        sphere(height);
    }
} else if (cutOff) {
  // Si la parte de arriba tiene un recorte para acomodar el dedo la dejamos como esta para que se imprima mejor
  cap();
  pole();
} else {
    // Si no queremos redondeado, ni recorte, la colocamos boca abajo para que la parte plana apoye sobre la cama de impresión
    translate([0, 0, height]) rotate([180, 0, 0]) {
        cap();
        pole();
    }
}


