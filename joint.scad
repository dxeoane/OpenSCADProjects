module pinion(h, r, angle) {
    y = r*tan(angle/2);
    polyhedron(    
        points = [
            [0, -y, 0],
            [0, 0, h],
            [0, y, 0],
            [r, y, 0],
            [r, 0, h],
            [r, -y, 0]            
        ],
        faces = [
            [0, 2, 1],
            [3, 4, 1, 2],
            [5, 4, 3],
            [1, 4, 5, 0],
            [0, 5, 3, 2]            
        ],
        convexity = 10
    );
}

module joint(h, r, n, base) {
    angle = 360 / n;
    difference() {
        intersection() {
            union() {
                cylinder(r = r, h = base, center = false, $fn=100);   
                for (i = [0:angle:360-angle]) {
                    rotate([0, 0, i]) pinion(h,r,angle);        
                } 
            }
            cylinder(r = r - 0.2, h = h, center = false, $fn=100);   
        }  
        translate([0,0,h - base]) cylinder(r = 2*r, h = base, center = false, $fn=100);    
    }
}

module male(h, r, n, base) {
    union() {
        joint(h,r,n,base);
        translate([0,0,-0.001]) cylinder(r = r / 2, h = h + 0.002, center = false, $fn=100);  
    }
}

module female(h, r, n, base) {
    translate([0,0,h]) rotate([180,0,0]) 
        difference() {
            cylinder(r = r + 2, h = h - 0.001, center = false, $fn=100);
            translate([0,0,-0.001]) male(h, r + 0.05, n, base);
        }
} 

// translate([0,30,0]) male(h = 5, r = 10, n = 6, base = 1);
// female(h =5, r = 10, n = 6, base = 1);

