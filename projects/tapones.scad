module tapon() {
    cylinder(d = 18.5, h = 2, $fn = 200);
    cylinder(d = 10, h = 8, $fn = 200);
}

module taponLavabo() {
    difference() {
        union(){
            cylinder(d1 = 38, d2 = 34, h = 10, $fn = 200);
            // Asa
            minkowski() {
                intersection(){
                    translate([0,0,-40]) cylinder(d = 38, h = 40, center = false, $fn = 200);
                    translate([0,0,10]) rotate([90,0,0]) cylinder(d = 30, h = 1, center = true, $fn = 200);
                }
                sphere(5, $fn = 200);
            }
        }        
        translate([0,0,2]) cylinder(d = 34 - 2, h = 10, $fn = 200);
    }

}



module taponLavaboRigidoConAsa() {
    cylinder(d = 38, h = 2, $fn = 200);
    difference(){
        cylinder(d = 34 - 8, h = 12, $fn = 200);
        cylinder(d = 34 - 8 - 4, h = 13, $fn = 200);
    }  
    intersection() {
        rotate([90,0,0]) rotate_extrude($fn = 200) translate([10,0,0]) circle(d = 10, $fn = 200); 
        translate([0,0,-60]) cylinder(d = 60, h = 60, center = false, $fn = 200);
    }
}

module juntaTaponLavabo() {
    difference() {
        cylinder(d1 = 38, d2 = 34, h = 10, $fn = 200);
        translate([0,0,-1]) cylinder(d = 34 - 8, h = 12, $fn = 200);
    }

}

module taponLavaboRigido() {    
    difference(){
        union(){
            cylinder(d = 38 - 1, h = 2, $fn = 200);
            cylinder(d = 34 - 8, h = 10 + 2, $fn = 200);
        }        
        translate([0,0,2]) cylinder(d = 34 - 8 - 4, h = 10 + 2, $fn = 200);
        translate([0,0,-1]) cylinder(d = 3, h = 4, $fn = 200);
    }  
}

module asa() {
    difference(){
        hull() {
            cylinder(d = 10, h = 1, $fn = 200);
            translate([0,0,30]) sphere(d = 30, $fn = 200);
        }
        translate([0,0,-0.001]) cylinder(d = 3, h = 32, $fn = 200);
    }
}

// taponLavaboRigido();
//translate([0,0,2]) 
// juntaTaponLavabo();
//rotate([180,0,0]) 
asa();

