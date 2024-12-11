module mandril(){
    difference() {
        hull() {
            translate([0,0,80]) sphere(d = 10, $fn = 100);
            cylinder(d = 30, h = 1, $fn = 100);
        }
        translate([-1.5, -50, -1]) cube([3,100,100], center = false);
        translate([-50, -1.5, -1]) cube([100,3,100], center = false);
    }
    cylinder(d = 80, h = 10, $fn = 100);
}

module empujador() {
    translate([-1.4, -16, 0]) cube([2.8,32,80], center = false);
    translate([-16, -1.4, 0]) cube([32,2.8,80], center = false);
    translate([-1.4, -5, 0]) cube([2.8,10,90], center = false);
    translate([-5, -1.4, 0]) cube([10,2.8,90], center = false);
    cylinder(d = 32, h = 10, $fn = 100);
}

mandril();
//translate([0,0,95]) rotate([0,180,0]) 
//empujador();