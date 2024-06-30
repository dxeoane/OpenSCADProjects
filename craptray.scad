module craptray() {
    difference() {
        union() {
            difference(){
                cube([180,140,40]);
                translate([5,5,5]) cube([170,130,40]);        
            }          
            for (p=[[10,10,0],[10,130,0],[170,10,0],[170,130,0]]) {
                translate(p) cylinder(r = 10, h = 40, $fn = 32);
            }  
        }
        for (p=[[10,10,-1],[10,130,-1],[170,10,-1],[170,130,-1]]) {
            translate(p) cylinder(d = 4.2, h = 42, $fn = 32);
            translate(p) cylinder(d = 8.2, h = 4, $fn = 6);
        } 
    }
}

module leg() {
    difference() {
        cylinder(d = 20, h = 8, $fn = 32);  
        translate([0,0,5 + 0.001]) cylinder(d = 8, h = 3, $fn = 6);
        translate([0,0,- 0.001]) cylinder(d = 4.2, h = 10, $fn = 32);
        for (a=[0:30:330]) {
            rotate(a) translate([0,13, -1]) cylinder(d = 8, h = 10, $fn = 32);
        }        
    }
    
}

leg();

// craptray();