 /* [Hidden] */
// Diámetro de los agujeros
holeDiameter = 4.05;

module vesaMount(holeDistance = 75, border = 5, thickness = 5) {
    $fn = 100;
    difference() {
        minkowski() {
            cube([holeDistance, holeDistance, thickness / 2]);
            cylinder(h = thickness / 2, r = border);
        } 
        for (i = [0:holeDistance:holeDistance]) {
            for (j = [0:holeDistance:holeDistance]) {
                translate([i, j, 0])
                cylinder(d = holeDiameter, h = thickness + 0.002, center = false);
            }
        }
    }
}
