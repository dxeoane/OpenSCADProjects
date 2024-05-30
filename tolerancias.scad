for (i = [4:1:8]) {
    translate([20*(i-4), 0, 0]) cylinder(d = i, h = 5, $fn = 64);    
    for (j = [0:0.05:0.4]) {
      translate([20*(i-4), (250 * j) + 20, 0]) difference(){ 
            cylinder(r = (i / 2) + 2, h = 5, $fn = 64);  
            cylinder(r = (i / 2) + j, h = 5.001, $fn = 64);
      }
    }
}

translate([-10, -10, 0]) cube([100, 140, 0.4]);