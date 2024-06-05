include <BOSL2/std.scad>
include <BOSL2/screws.scad>

$fn = 100;


module base() {
    difference() {
        union() {
            intersection(){
                union(){
                    translate([0,0,19]) cylinder(r=25, h = 6); 
                    cylinder(d=36.5, h = 60);       
                }
                difference(){
                    cylinder(r=24, h = 25);
                    translate([0,0,2]) cylinder(d=32.5, h = 25);   
                } 
            }
           translate([0,0,-(20/2)+2]) screw("3/4", length = 20);
        }
        translate([0,0,-25 - 0.001]) cylinder(d=8, h = 28 + 0.002);
        translate([0,0,-28 / 2 + 0.001]) cube([10, 3, 50 + 0.002], center = true);
        rotate([0,0,90]) translate([0,0,-28 / 2 + 0.001]) cube([10, 3, 50 + 0.002], center = true);
    }
}

module tuerca() {
  difference(){
    cylinder(d=70, h=15, center = true);
    screw_hole("3/4", length = 16, thread = true);
    for (i=[0:30:330]) {
        rotate([0,0,i]) translate([35,0,0]) cylinder(d=10, h= 15 + 0.002, center = true);
    }
    translate([0,0,5]) cylinder(d=55, h=15, center = true);
  }  
  
}

// base();

tuerca();





