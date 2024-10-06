
buttonDiameter = 40;

module button() {
    difference() {
        union() {
            hull(){
                cylinder(d = 5, h = 30, $fn = 100);
                translate([60,0,0]) cylinder(d = 5, h = 10, $fn = 100);
            }
            minkowski() {
                cylinder(d = buttonDiameter, h = 20, $fn = 100);
                intersection() {
                    sphere(d = 20, $fn = 100);
                    translate([-10,-10,0]) cube([20,20,10]);
                }
            }   
        }
        translate([0,0,-3]) minkowski() {
            cylinder(d = buttonDiameter - 6, h = 20, $fn = 100);
            intersection() {
                sphere(d = 20, $fn = 100);
                translate([-10,-10,0]) cube([20,20,10]);
            }
        }   
    }     
}

button();