include <../front.scad>

module buttonPanel(){
    difference(){
        front2();
        for (p=[[254/8, 43.5/2, 0],[2*254/8, 43.5/2, 0]]) {
            translate(p) {
                translate([0,0,-1]) cylinder(d = 12, h = 50, center = false, $fn = 200);
                translate([0,0,2]) cylinder(d = 20, h = 50, center = false, $fn = 200);
            }
        }
        for (p=[[3*254/8, 43.5/2, 0],[3*254/8 + 10, 43.5/2, 0],[3*254/8 - 10, 43.5/2, 0]]) {
            translate(p) {
                translate([0,0,-1]) cylinder(d = 3, h = 50, center = false, $fn = 200);
            }
        }
    }
}

buttonPanel();