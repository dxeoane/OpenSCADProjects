module clip(n) {
    difference() {
        union() {            
            for (i=[0:n-1]) {
                translate([0, 0, 3*i - 0.001]) cylinder(d1 = 10, d2 = 6, h = 3, $fn = 100);
            }  
        }
        translate([0,0,-0.01]) cylinder(d = 4.2, h = 50, $fn = 100);
        translate([0,0,-0.01]) cylinder(d = 4.2, h = 50, $fn = 100);
    }

}

//for (j=[4:10]) {
//    translate([20*(j-4),0,0]) clip(j);
//}

difference() {
    cube([16,12,8], center = true);
    cylinder(d = 8.2, h = 4 + 0.1, $fn = 6);
    cylinder(d = 5, h = 20, $fn = 100, center = true);
}
