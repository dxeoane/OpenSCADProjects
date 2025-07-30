module cono(d1, d2, h) {
    hull(){
        cylinder(d=d1, h=0.001, center=false, $fn=200);
        translate([0, 0, h]) sphere(d=d2, $fn=200);
    }
}

module cacoleta(d1, d2, h) {
    difference(){
        union() {
            difference() {
                cono(d1, d2, h);
                translate([0, 0, -0.001]) cono(d1 - 6, d2 - 6, h);
            }
            translate([0, 0, h + (d2 / 2) - 3]) cylinder(d=12 + 6, h=30, center=false, $fn=200);
        }
        translate([0, 0, h + (d2 / 2) - 6 - 0.001]) cylinder(d=12, h=30 + 3 + 0.002, center=false, $fn=200);
    }
}



cacoleta(120, 80, 80);