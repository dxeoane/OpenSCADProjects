include <gancho.scad>

module angle(x){
    hull(){
        cube([x, 23, 1]);
        translate([0,23/2,13]) rotate([0,90,0]) cylinder(d = 6, h = x, $fn = 200);
    }
}

module holder(){
   difference() {
        angle(30);
        translate([-1,0,-4]) angle(32);
   } 
   translate([30 - 2,23/2,13 + 2]) rotate([0,90,0]) cylinder(d = 6, h = 2, $fn = 200);
   translate([0.3, 23/2, 13 + 1]) ganchos(1);
}

holder();