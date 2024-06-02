include <vesa.scad>
include <clamp.scad>

// Distancia entre los agujeros
holeDistance = 100; // [75,100]
// Borde de la placa
border = 5;
// Grosor de la placa
thickness = 5;
// Angulo del poste
angle = 0; // [0:45]

// Radio interno de la pinza
clampRadius = 20;
// Ancho de las tiras de la pinza
clampHeight = 20;
// Posicion del cierre de la pinza
clampLockAngle = 90; // [0,45,90,135]

// Separación entre la placa y las pinzas
separation =  30;
// Grosor del separador
separatorWidth = 20;

 /* [Hidden] */
clampOuterRadius = clampRadius + 2;

translate([-holeDistance/2,-holeDistance/2,0]) vesaMount(holeDistance, border, thickness);
rotate([0,0,angle]){
    translate([-holeDistance/2,-holeDistance/2,0]) {
        translate([clampHeight/2 - border, holeDistance / 2, clampOuterRadius + thickness + separation]) rotate([0,-90,0]) clamp(clampHeight, clampRadius, lockAngle = clampLockAngle);
        translate([holeDistance - clampHeight/2 + border, holeDistance / 2, clampOuterRadius + thickness + separation]) rotate([0,-90,0]) clamp(clampHeight, clampRadius, lockAngle = clampLockAngle);
        difference() {
            translate([-border,(holeDistance - separatorWidth) / 2,-0.001]) cube([holeDistance + 2*border, separatorWidth, clampRadius + separation + thickness + 0.002], center = false);
            translate([holeDistance / 2 - 0.001,holeDistance/ 2,clampOuterRadius + thickness + separation]) rotate([0,90,0]) cylinder(r = clampRadius, h = holeDistance + 2*border + 0.005, center = true);
        }
    }
}


