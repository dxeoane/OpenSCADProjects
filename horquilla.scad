module horquilla() {
    hull(){
        minkowski() {
            cube([10, 10, 3 - 0.002], center = true);
            cylinder(r = 5, h = 0.001, $fn = 200); 
        }
        translate([65,0,0]) cylinder(r = 2.5, h = 3, $fn = 200, center = true);
    } 
}

module enganche() {
    difference() {
        hull(){
            cube([10, 2.5, 3]);
            translate([5,0,5 + 3]) rotate([-90,0,0]) cylinder(r = 5, h = 2.5, $fn = 200);
        }
        translate([5,-0.001,5 + 3]) rotate([-90,0,0]) cylinder(d = 1.8, h = 2.5 + 0.002, $fn = 200);
    }
}

module horquilla_y_enganche() {
    translate([0,0,3/2]) horquilla();
    translate([0,13/2 - 2.5,0]) enganche();
    translate([0,-13/2,0]) enganche(); 
    translate([-8,-13/2 +2.5,0]) cube([8, 1, 4]);
}

// horquilla();
// enganche();
horquilla_y_enganche();