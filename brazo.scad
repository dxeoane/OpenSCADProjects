include <joint.scad>
include <gancho.scad>

model = "All"; // [All, Female, Male, Base, Skadis]

 /* [Hidden] */
 $fn = 100;

module brazo1(){
    difference(){   
        union(){     
            hull(){
                cylinder(h = 5, r = 12, center = false);
                translate([35,0,2.5]) cube([50, 10, 5], center = true);
            }
            cylinder(h = 10, r = 12, center = false);
        }
        translate([0,0,5 - 0.1]) cylinder(h =  5 + 0.101, r = 11, center = false);
        // Tuerca
        cylinder(h =  12, r = 2, center = true);
        translate([0,0,- 0.001]) cylinder(h =  3, r = 4, center = false, $fn = 6);
    }
    translate([0,0,5 + 0.001]) femaleJoint(h =5, r = 10, n = 8, base = 1);
}

module brazo2(){
    difference(){
        union(){
            rotate([180,0,0]) hull(){
                cylinder(h = 5, r = 12, center = false);
                translate([35,0,2.5]) cube([50, 10, 5], center = true);
            }
            translate([0,0,0.001]) maleJoint(h = 5, r = 10, n = 8, base = 1);   
        }
        // Tuerca
        cylinder(h =  12, r = 2, center = true);
        translate([0,0,-5 - 0.001]) cylinder(h =  3, r = 4, center = false, $fn = 6);
    } 
}

module brazoMixto(){
  brazo1();
  translate([119,0,5]) rotate([0,0,180]) brazo2();
}

module base(){
    difference(){   
        union(){     
            hull(){
                cylinder(h = 5, r = 12, center = false);
                translate([20,0,2.5]) cube([10, 24, 5], center = true);
            }
            cylinder(h = 10, r = 12, center = false);
            translate([20,0,15]) cube([10, 24, 30], center = true);  
        }
        translate([0,0,5 - 0.1]) cylinder(h =  5 + 0.101, r = 11, center = false);
        // Tuerca
        cylinder(h =  12, r = 2, center = true);
        translate([0,0,- 0.001]) cylinder(h =  3, r = 4, center = false, $fn = 6);
        for (i=[-6:12:6]) for (j=[15:9:24]) {
            translate([16.5 - 0.001,i,j])  rotate([0,90,0]) union(){
                cylinder(h =  20, r = 2, center = true);
                cylinder(h =  3, r = 4, center = true, $fn = 6);
            }
        }
        
    }
    translate([0,0,5 + 0.001]) femaleJoint(h =5, r = 10, n = 8, base = 1);
}

module baseSkadis(){
    difference(){   
        union(){     
            hull(){
                cylinder(h = 5, r = 12, center = false);
                translate([20,0,2.5]) cube([10, 24, 5], center = true);
            }
            cylinder(h = 10, r = 12, center = false);
            translate([30,10, 22]) cube([10, 60, 44], center = true);  
            translate([35,35,2]) rotate([90,0,180]) ganchos(2);
            translate([35,-5,2]) rotate([90,0,180]) ganchos(2);
        }
        translate([0,0,5 - 0.1]) cylinder(h =  5 + 0.101, r = 11, center = false);
        // Tuerca
        cylinder(h =  12, r = 2, center = true);
        translate([0,0,- 0.001]) cylinder(h =  3, r = 4, center = false, $fn = 6);  
    }
    translate([0,0,5 + 0.001]) femaleJoint(h =5, r = 10, n = 8, base = 1);
}


if (model == "All")
    brazoMixto();
else if (model == "Male")
    brazo2();
else if (model == "Female")
    brazo1();
else if (model == "Base")
    base();
else if (model == "Skadis")
    baseSkadis();
else
    brazoMixto();



