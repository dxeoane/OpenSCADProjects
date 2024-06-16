module tapon(r, h) {
   union() {        
        color("blue") union() {
            intersection() {
                union() {
                    translate([(1.5-r),0,4/2]) cube([3, 6, h], center = true);       
                    translate([(r-1.5),0,4/2]) cube([3, 6, h], center = true);    
                } 
                cylinder(r = r, h = h + 6, center = true, $fn=100);
            }
            intersection() {
                union() {
                    translate([r,0,(h + 6 - 3)/2 + 0.05]) cube([4,6,3], center = true);
                    translate([-r,0,(h + 6 - 3)/2 + 0.05]) cube([4,6,3], center = true);
                }
                translate([0,0,h/2]) cylinder(r1 = r + 3, r2 = r - 6, h = 6, center = false, $fn=100);
            }
            translate([(2.5-r),0,6/2]) cube([1.5, 6, h + 6], center = true);       
            translate([(r-2.5),0,6/2]) cube([1.5, 6, h + 6], center = true);  
        }
        color("green") intersection() {
            cylinder(r = r, h = h, center = true, $fn=100);
            cube([r, 2 * r, h], center = true);
        }
        translate([0,0,(2-h) / 2]) cylinder(r = r + 2, h = 2, center = true, $fn=100);
   }
}

module tapon_hueco(r, h) {
    difference() {
        cylinder(r = r + 2, h = h - 2, center = true, $fn=100); 
        cylinder(r = r + 0.05, h = h, center = true, $fn=100);
    }  
    translate([r - 1,4 + 0.05,0]) cube([2 , 2, h - 2], center = true);
    translate([-r + 1,4 + 0.05,0]) cube([2 , 2, h - 2], center = true);
}

/*
difference(){    
    tapon(10, 10);
    cube([8, 16, 12], center = true);
}
*/


// hueco(10, 10);

