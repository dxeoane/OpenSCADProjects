module honeycomb(r1, r2, x, y, z) {
    a = r1*sin(60);
    b = r1*cos(60);
    intersection(){        
        for (i=[0:x-1]) for (j=[0:y-1]) {
            translate([i*3*r1, j*2*a]) cylinder( r = r2, h = z, center = false, $fn = 6);    
            translate([i*3*r1 + r1 + b, j*2*a + a]) cylinder( r = r2, h = z, center = false, $fn = 6);    
        }
        cube([(x-1) * (r1 + b) ,2*(y-1)*a, z], center = false);
    }
}