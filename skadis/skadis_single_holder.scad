include <gancho.scad>

module holder() {
    ganchos(1);
    translate([0,0,-40]) ganchos(1);
    rotate([0,90,0]) hull(){
        cylinder(d = 4, h=3, $fn = 32);
        translate([40, 0, 0]) cylinder(d = 4, h=3, $fn = 32);
    }  
    rotate([0,-5,0]) translate([0, -2, -20]) cube([30 + 3,4,6]);
}

holder();