module giftbox(diameter, height){
    difference() {
        cylinder(d=diameter + 2, h=height + 1, $fn=200);
        translate([0,0,1]) cylinder(d=diameter, h=height + 1, $fn=200);
    }
}

// Ejemplo de uso
//giftbox(120, 120);
giftbox(120 + 2 + 0.4, 60);