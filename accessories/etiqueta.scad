module etiqueta(width = 60, height = 16, text = "Etiqueta") {
    difference() {
        // Cuerpo de la etiqueta
        cube([width, height, 1]);
        
        // Recorte para las bridas
        for (p = [[2, 1, -0.001], [2, height - 1 - 1.5, -0.001], [width - 2 - 4.8, 1, -0.001], [width - 2 - 4.8, height - 1 - 1.5, -0.001]]) {
            translate(p)  cube([4.8, 1.5, 1 + 0.002]);
        }
    }
    // Texto de la etiqueta
    translate([width / 2, height / 2, 0]) {
        linear_extrude(height = 2) {
            text(text, size = height / 2, valign = "center", halign = "center", font = "Arial");
        }
    }
}

etiqueta(width = 40, height = 12, text = "PC");