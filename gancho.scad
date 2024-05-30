module ganchos(n=1){    
    for (i=[0:1:n-1]){
        translate([0,40*i,,0]) rotate([0, 90, 0]) translate([0, 0, -9]) {
            cylinder(d = 5, h=9, $fn = 32);
            hull(){
                cylinder(d = 5, h=3, $fn = 32);
                translate([10, 0, 0]) cylinder(d = 5, h=3, $fn = 32);
            } 
        }
    }   
}

ganchos(3);
