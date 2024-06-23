module clip(){
    difference() {
        cube([35,10,20]);
        translate([2,-1,2]) cube([31,12,16]);
        translate([10,-1,-1]) cube([2,12,4]);
    }
    translate([35/2, 10/2, 20]) cylinder(d = 8, h= 1.5, $fn = 32);
    translate([35/2 - 8/2, 10/2 - 10/2, 20 + 1.5]) cube([8,10,2]);
}

clip();