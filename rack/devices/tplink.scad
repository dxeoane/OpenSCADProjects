include <../front.scad>

module tplink(){    
    difference(){
        front();
        translate([(254/2) - 80,(43.5 - 26) / 2, 5 - 0.001]) cube([80 + 0.001,26, 5 + 0.002]);
        translate([(254/2) - 70,(43.5 - 26) / 2, -0.001]) cube([70 + 0.001,26, 5 + 0.002]);
    }
    difference(){
        union() {
            translate([(254/2) - 82, (43.5 - 30) / 2, 5]) cube([82, 30, 102]);
            translate([(254/2) - 5, 0, 5]) cube([5, 43.5, 110]);
        }
        translate([(254/2) - 80, (43.5 - 30) / 2 + 2, 5 -0.001]) cube([80 + 0.001, 26, 100 + 0.001]);        
        translate([254/2,(43.5 - 30) / 4, 20]) rotate([0,90,0]) cylinder(d = 3.05, h = 20, center = true, $fn = 32);
        translate([254/2,(43.5 - 30) / 4, 110 - 20]) rotate([0,90,0]) cylinder(d = 3.05, h = 20, center = true, $fn = 32);     
        translate([254/2,43.5 - (43.5 - 30) / 4, 20]) rotate([0,90,0]) cylinder(d = 3.05, h = 20, center = true, $fn = 32);
        translate([254/2,43.5 - (43.5 - 30) / 4, 110 - 20]) rotate([0,90,0]) cylinder(d = 3.05, h = 20, center = true, $fn = 32);     
        translate([(254/2) - 83,0,22]) cube([50,43.5,100]);
    }
}

tplink();