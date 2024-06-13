include <gancho.scad>;
include <honeycomb.scad>;


module calibre_digital() {
    difference() {
        minkowski() {
            cube([45,15.5,15], center = true);
            sphere(3, $fn = 100);
        }
        translate([0,0,15/2 + 3/2]) cube([60,25,3], center = true);
        translate([18.5,0,0.001]) cylinder(d = 12, h = 18, center = true, $fn = 100);
        translate([18.5,0,0.001]) cylinder(d = 8, h = 30, center = true, $fn = 100);
        translate([-5,0,0]) {            
            cube([32,15.5,15 + 0.002], center = true);
            translate([-2,1.5,0]) cube([16,15.5 + 3 + 0.001,30], center = true);
        }
    }
    translate([20,-(15.5/2 + 3 - 0.001),5]) rotate([0,0,90]) ganchos(2);
}

module lupa() {
    difference() {
        minkowski() {
            rotate([90,0,0]) cylinder(d = 110, h = 20, center = true, $fn = 100);
            sphere(3, $fn = 100);
        }
        rotate([90,0,0]) cylinder(d = 110, h = 20, center = true, $fn = 100);
        translate([0,0,150/2]) cube([150,30,150], center = true);
        translate([0,1.5,0]) cube([52,20 + 3,150], center = true);
    }
    translate([20,-(10 + 3 - 0.001),-5]) rotate([0,0,90]) ganchos(2);
}

module cesto() {
    difference() {
        cube([130,50,130], center = false);
        translate([2,2,2]) cube([126,46,130], center = false);
        translate([5,130 + 0.005, 5]) rotate([90,0,0]) honeycomb(10, 9, 9, 8, 130 + 0.01);   
    }
    translate([(130-80)/2 + 80,- 0.001,105]) rotate([0,0,90]) ganchos(3);
    translate([0,0,99]) cube([130,2,10], center = false);
}

// Agujeros mas amplios
module cesto2() {
    difference() {
        cube([130,50,130], center = false);
        translate([2,2,2]) cube([126,46,130], center = false);
        translate([5,130 + 0.005, 5]) rotate([90,0,0]) honeycomb(20, 18, 5, 4.5, 130 + 0.01);
    }
    translate([(130-80)/2 + 80,- 0.001,105]) rotate([0,0,90]) ganchos(3);
    translate([0,0,99]) cube([130,2,10], center = false);
}

// Menos soportes
module cesto3() {
    difference() {
        cube([130,50,130], center = false);
        translate([2,2,2]) cube([126,46,130], center = false);
        translate([5,130 + 0.005, 125]) rotate([90,90,0]) honeycomb(20, 18, 5, 4.5, 130 + 0.01);
    }
    translate([(130-80)/2 + 80,- 0.001,130 - 3]) rotate([0,0,90]) ganchos(3);
}

module cesto_eco() {
    rotate([-90,0,0]) {
        difference() {
            cube([130,50,130], center = false);
            translate([2,2,2]) cube([126,46,130], center = false);
            translate([5, 130 + 0.005 + 5, 5]) rotate([90,0,0]) honeycomb(20, 18, 5, 4.5, 130 + 0.01);
            translate([2,-0.01,10]) cube([126,2 + 0.02,110], center = false);
        }
        translate([(130-80)/2 + 80,- 0.001,125]) rotate([0,0,90]) ganchos(3);
    }
}

module cesto_eco2() {
    difference() {
        cube([130,50,130], center = false);
        translate([2,2,2]) cube([126,46,130], center = false);
        translate([5,130 + 0.005 + 5, 125]) rotate([90,90,0]) honeycomb(20, 18, 5, 4.5, 130 + 0.01);
        translate([2,-0.01,10]) cube([126,2 + 0.02,115], center = false);
    }
    translate([(130-80)/2 + 80,- 0.001,130 - 3]) rotate([0,0,90]) ganchos(3);
}

module cesto_eco3() {
    difference() {
        cube([130,50,130], center = false);
        translate([2,2,2]) cube([126,46,130], center = false);
        translate([5,130 + 0.005 + 5, 125]) rotate([90,90,0]) honeycomb(20, 18, 5, 4.5, 130 + 0.01);
        translate([2,-0.01,10]) cube([126,2 + 0.02,115], center = false);
    }
    translate([(130-80)/2 + 80,- 0.001,130 - 3]) rotate([0,0,90]) ganchos(3);
    translate([(130-80)/2 + 80,- 0.001,10 - 3]) rotate([0,0,90]) ganchos(3);
}

module cesto_eco3() {
    difference() {
        cube([130,50,130], center = false);
        translate([2,2,2]) cube([126,46,130], center = false);
        translate([5,130 + 0.005 + 5, 125]) rotate([90,90,0]) honeycomb(20, 18, 5, 4.5, 130 + 0.01);
        translate([-0.05,0 + 5, 125]) rotate([0,90,0]) honeycomb(20, 18, 5, 2.2, 130 + 0.1);
        translate([2,-0.01,10]) cube([126,2 + 0.02,115], center = false);
    }
    translate([(130-80)/2 + 80,- 0.001,130 - 3]) rotate([0,0,90]) ganchos(3);
    translate([(130-80)/2 + 80,- 0.001,10 - 3]) rotate([0,0,90]) ganchos(3);
}

module linterna() {
    difference() {
        union() {
            cylinder(d = 37, h = 60, center = false, $fn = 100);
            translate([0,-10,0]) cube([20,20,60], center = false);
            translate([20 - 0.001, 0, 3]) rotate([0,180,0]) ganchos(1);
            translate([20 - 0.001, 0, 43]) rotate([0,180,0]) ganchos(1);
        }
        translate([0,0,-0.001]) cylinder(d = 35, h = 58, center = false, $fn = 100);
        cylinder(d = 20, h = 65, center = false, $fn = 100);
    }      
}



// calibre_digital();
// lupa();
// cesto();
// cesto2();
// cesto3();
// cesto_eco3();

linterna();