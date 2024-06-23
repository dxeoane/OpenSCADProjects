module left(){
    translate([35/2 + 5,0,0]) difference(){
        cube([55,58,45]);
        translate([5,5,5]) cube([50 + 0.01,48,40 + 0.01]);
        translate([-0.001, (58 - 10) / 2, 15]) cube([5 + 0.01, 10, 35]);
    }  
    difference(){ 
        cube([35/2 + 10,5,25 * 3]);  
        for(i = [25/2, 25/2 + 25, , 25/2 + 25 * 2]) {
            translate([35/2 - 5,0,i - 8/2]) rotate([90,0,0]) cylinder(d = 8, h = 12, center = true, $fn= 32);
            translate([35/2 - 5,0,i + 8/2]) rotate([90,0,0]) cylinder(d = 8, h = 12, center = true, $fn= 32);
            translate([35/2 - 5 - 8/2,-0.1,i - 8/2]) cube([8,5 + 0.2,8]);
        }
    }
}

module right(){
    translate([35/2 + 20,0,0]) difference(){
        cube([55,58,45]);
        translate([5,5,5]) cube([50 + 0.01,48,40 + 0.01]);
    }  
    translate([0, 58 - 5, 0]) difference(){ 
        cube([35/2 + 20,5,25 * 3]);  
        for(i = [25/2, 25/2 + 25, , 25/2 + 25 * 2]) {
            translate([35/2,0,i - 8/2]) rotate([90,0,0]) cylinder(d = 8, h = 12, center = true, $fn= 32);
            translate([35/2,0,i + 8/2]) rotate([90,0,0]) cylinder(d = 8, h = 12, center = true, $fn= 32);
            translate([35/2 - 8/2,-0.1,i - 8/2]) cube([8,5 + 0.2,8]);
        }
    }
}

left();
translate([180,58,0]) rotate([0,0,180]) right();