include <gancho.scad>

// Create a hole for the USB connector
module hole(){
    tolerance = 0.2;    
    cube([4.5 + tolerance, 12 + tolerance, 15], center = false);
}

module holder(){
    difference(){
        cube([100, 25, 12 + 2], center = false);
        
        for (i = [0 : 8]){
            translate([i * 10 + (100-84.5)/2, (25 - 12) / 2, 2 + 0.001]){
                hole();
            }
        }
    }
    translate([80 + (100 - 80)/2, 0.2, 12]){
        rotate([0, 0, 90]) ganchos(3);
    }
}


holder();