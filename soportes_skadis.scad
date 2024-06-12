include <gancho.scad>;


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

module rejilla(r1, r2, x, y, z) {
    a = r1*sin(60);
    b = r1*cos(60);
    intersection(){        
        for (i=[0:x-1]) for (j=[0:y-1]) {
            translate([i*3*r1, j*2*a]) cylinder( r = r2, h = z, center = false, $fn = 6);    
            translate([i*3*r1 + r1 + b, j*2*a + a]) cylinder( r = r2, h = z, center = false, $fn = 6);    
        }
        cube([(x-1) * (r1 + b) ,2*(y-1)*a, z], center = false);
    }
}

module cesto() {
    difference() {
        cube([130,50,130], center = false);
        translate([2,2,2]) cube([126,46,130], center = false);
        translate([5,130 + 0.005, 5]) rotate([90,0,0]) rejilla(10, 9, 9, 8, 130 + 0.01);   
    }
    translate([(130-80)/2 + 80,- 0.001,105]) rotate([0,0,90]) ganchos(3);
    translate([0,0,99]) cube([130,2,10], center = false);
}

// Agujeros mas amplios
module cesto2() {
    difference() {
        cube([130,50,130], center = false);
        translate([2,2,2]) cube([126,46,130], center = false);
        translate([5,130 + 0.005, 5]) rotate([90,0,0]) rejilla(20, 18, 5, 4.5, 130 + 0.01);
    }
    translate([(130-80)/2 + 80,- 0.001,105]) rotate([0,0,90]) ganchos(3);
    translate([0,0,99]) cube([130,2,10], center = false);
}

// Menos soportes
module cesto3() {
    difference() {
        cube([130,50,130], center = false);
        translate([2,2,2]) cube([126,46,130], center = false);
        translate([5,130 + 0.005, 125]) rotate([90,90,0]) rejilla(20, 18, 5, 4.5, 130 + 0.01);
    }
    translate([(130-80)/2 + 80,- 0.001,130 - 3]) rotate([0,0,90]) ganchos(3);
}

module cesto_eco() {
    rotate([-90,0,0]) {
        difference() {
            cube([130,50,130], center = false);
            translate([2,2,2]) cube([126,46,130], center = false);
            translate([5, 130 + 0.005 + 5, 5]) rotate([90,0,0]) rejilla(20, 18, 5, 4.5, 130 + 0.01);
            translate([2,-0.01,10]) cube([126,2 + 0.02,110], center = false);
        }
        translate([(130-80)/2 + 80,- 0.001,125]) rotate([0,0,90]) ganchos(3);
    }
}

module cesto_eco2() {
    difference() {
        cube([130,50,130], center = false);
        translate([2,2,2]) cube([126,46,130], center = false);
        translate([5,130 + 0.005 + 5, 125]) rotate([90,90,0]) rejilla(20, 18, 5, 4.5, 130 + 0.01);
        translate([2,-0.01,10]) cube([126,2 + 0.02,115], center = false);
    }
    translate([(130-80)/2 + 80,- 0.001,130 - 3]) rotate([0,0,90]) ganchos(3);
}



// calibre_digital();
// lupa();
// cesto();
// cesto2();
// cesto3();
cesto_eco2();