BigDiameter = 120;
SmallDiameter = 80;
HoleDiameter = 12;
Height = 40;

module cone(d1, d2, h) {
    hull(){
        cylinder(d=d1, h=0.001, center=false, $fn=200);
        translate([0, 0, h]) sphere(d=d2, $fn=200);
    }
}

module canopy(d1, d2, d3, h) {
    difference(){
        union() {
            difference() {
                cone(d1, d2, h);
                translate([0, 0, -0.001]) cone(d1 - 6, d2 - 6, h);
            }
            translate([0, 0, h + (d2 / 2) - 3]) cylinder(d=d3 + 6, h=30, center=false, $fn=200);
        }
        translate([0, 0, h + (d2 / 2) - 6 - 0.001]) cylinder(d=d3, h=30 + 3 + 0.002, center=false, $fn=200);
    }
}



canopy(BigDiameter, SmallDiameter, HoleDiameter, Height);