$fn = 100;

module knob(d, h, n){
    d2 = 3.14159*d/(2*n);
    difference() {
        union() {
            for (i = [0:n-1]) {
                rotate([0, 0, i * 360/n]) translate([d/2, 0, 0]) cylinder(h = h, d = d2);
            }
            cylinder(h = h, d = d);
        }
        for (i = [0:n-1]) {
                rotate([0, 0, (i + 0.5) * 360/n]) translate([d/2, 0, -0.001]) cylinder(h = h + 0.002, d = d2);
        }
    }   
}

module knob2(d1, h, n){
    d2 = 3.14159*d1/(2*n);
    difference() {
        cylinder(h = h, d = d1);
        for (i = [0:n-1]) {
                rotate([0, 0, i * 360/n]) translate([d1/2 + d2/2, 0, -0.001]) cylinder(h = h + 0.002, d = 2*d2);
        }
    }   
}

module knob3(d, h, n){
    d2 = 3.14159*d/(2*n);
    for (i = [0:n-1]) {
        rotate([0, 0, i * 360/n]) translate([d/2, 0, 0]) cylinder(h = h, d = d2);
    }
    cylinder(h = h, d = d);
}

// tarda mucho tiempo en renderizar
module knob4(d1, h, n){
    d2 = 3.14159*d1/(2*n);
    minkowski() {
        difference() {
            cylinder(h = h, d = d1);
            for (i = [0:n-1]) {
                rotate([0, 0, i * 360/n]) translate([d1/2 + d2/2, 0, -0.001]) cylinder(h = h + 0.002, d = 2*d2);
            }
        }   
        sphere(5);
    }      
}

// tarda mucho tiempo en renderizar, pero menos que el knob4
module knob5(d1, h, n){
    d2 = 3.14159*d1/(2*n);
    minkowski() {
        difference() {
            cylinder(h = h, d = d1);
            for (i = [0:n-1]) {
                rotate([0, 0, i * 360/n]) translate([d1/2 + d2/2, 0, -0.001]) cylinder(h = h + 0.002, d = 2*d2);
            }
        }   
        cylinder(h = 0.001, d = 5);
    }      
}


module knob6(d, h, n){
    d2 = 3.14159*d/(2*n);
    for (i = [0:n-1]) {
        rotate([0, 0, i * 360/n]) translate([d/2, 0, d2/2]) sphere(d = d2);
        rotate([0, 0, i * 360/n]) translate([d/2, 0, h - d2/2]) sphere(d = d2);
        rotate([0, 0, i * 360/n]) translate([d/2, 0, d2/2]) cylinder(h = h - d2, d = d2);
    }
    cylinder(h = h, d = d);
}

module knob7(d, h, n){
    d2 = 3.14159*d/n;
    for (i = [0:n-1]) {
        rotate([0, 0, i * 360/n]) translate([d/2, 0, d2/2]) sphere(d = d2);
        rotate([0, 0, i * 360/n]) translate([d/2, 0, h - d2/2]) sphere(d = d2);
        rotate([0, 0, i * 360/n]) translate([d/2, 0, d2/2]) cylinder(h = h - d2, d = d2);
    }
    cylinder(h = h, d = d);
}

module knob8(d, h, n){
    d2 = 3.14159*d/(2*n);
    difference() {
        cylinder(h = h, d = d);
        for (i = [0:n-1]) {
            rotate([0, 0, i * 360/n]) translate([d/2, 0, d2/2]) sphere(d = d2);
            rotate([0, 0, i * 360/n]) translate([d/2, 0, h - d2/2]) sphere(d = d2);
            rotate([0, 0, i * 360/n]) translate([d/2, 0, d2/2]) cylinder(h = h - d2, d = d2);
        }
    }
}

module knob9(d, h, n){
    d2 = 3.14159*d/(2*n);
    intersection() {
        difference() {
            cylinder(h = h, d = d);
            for (i = [0:n-1]) {
                rotate([0, 0, i * 360/n]) translate([d/2, 0, d2/2]) sphere(d = d2);
                rotate([0, 0, i * 360/n]) translate([d/2, 0, h - d2/2]) sphere(d = d2);
                rotate([0, 0, i * 360/n]) translate([d/2, 0, d2/2]) cylinder(h = h - d2, d = d2);
            }
        }
        translate([0, 0, h/2]) sphere(d = d);
    }
}

module knob10(d, h, n){
    d2 = 3.14159*d/(2*n);
    intersection() {
        difference() {
            union() {
                for (i = [0:n-1]) {
                    rotate([0, 0, i * 360/n]) translate([d/2, 0, 0]) cylinder(h = h, d = d2);
                }
                cylinder(h = h, d = d);
            }
            for (i = [0:n-1]) {
                    rotate([0, 0, (i + 0.5) * 360/n]) translate([d/2, 0, -0.001]) cylinder(h = h + 0.002, d = d2);
            }
        }   
        translate([0, 0, h/2]) sphere(d = d + d2/2);
    }
}

module knob11(d1, h, n, x){
    d2 = 3.14159*d1/n;
    difference() {
        cylinder(h = h, d = d1);
        for (i = [0:n-1]) {
                rotate([0, 0, i * 360/n]) translate([d1/2 + x, 0, -0.001]) cylinder(h = h + 0.002, d = d2);
        }
    }   
}

module knob12(d1, h, n){
    d2 = 3.14159*d1/(2*n);
    difference() {
        union() {
            cylinder(h = h, d = d1);
            for (i = [0:n-1]) {
                rotate([0, 0, (i+0.5) * 360/n]) translate([d1/2, 0, 0]) cylinder(h = h, d = d2/2);
            }  
        }
        for (i = [0:n-1]) {
            rotate([0, 0, i * 360/n]) translate([d1/2 + d2/2, 0, -0.001]) cylinder(h = h + 0.002, d = 2*d2);
        }
    }     
}

module knob13(d, h, n){
    d2 = 3.14159*d/(2*n);
    difference() {
        cylinder(h = h, d1 = d, d2 = d - d2);
        for (i = [0:n-1]) {
            rotate([0, 0, (i + 0.5) * 360/n]) translate([d/2, 0, -0.001]) cylinder(h = h + 0.002, d = d2);
        }
    }   
}


module knob14(d, h, n){
    d2 = 3.14159*d/(2*n);
    difference() {
        hull() {
            translate([0, 0, max(h, (d - d2)/2)]) sphere(d = d - d2);
            cylinder(h = h, d1 = d, d2 = d - d2);
        }
        for (i = [0:n-1]) {
            rotate([0, 0, (i + 0.5) * 360/n]) translate([d/2, 0, -0.001]) cylinder(h = h + 0.002, d = d2);
        }
    }   
}

module knob15(d, h, n){
    d2 = 3.14159*d/(4*n);
    difference() {
        cylinder(h = h, d = d);
        for (i = [0:n-1]) {
            rotate([30, 0, (i + 0.5) * 360/n]) translate([d/2, 0, 0]) cylinder(h = 10*h, d = d2, center=true);
            rotate([-30, 0, i * 360/n]) translate([d/2, 0, 0]) cylinder(h = 10*h, d = d2, center=true);
        }
    }   
}

module knob16(d, h, n){
    d2 = 3.14159*d/(2*n);
    d3 = d - d2;
    h2 = max(h, (d - d2)/2);
    difference() {
        hull() {
            translate([0, 0, h2]) sphere(d = d3);
            cylinder(h = h, d1 = d, d2 = d3);
            translate([d3/2, 0, 0]) cylinder(h = h2, d = d2);
            translate([d3/2, 0, h2]) sphere(d = d2);
        }
        for (i = [1:n-2]) {
            rotate([0, 0, (i + 0.5) * 360/n]) translate([d/2, 0, -0.001]) cylinder(h = h + 0.002, d = d2);
        }
    }   
}

module knob17(d, h, n){
    d2 = 3.14159*d/(2*n);
    d3 = d - d2;
    h2 = max(h, (d - d2)/2);
    difference() {
        hull() {
            translate([0, 0, h2]) sphere(d = d3);
            cylinder(h = h, d1 = d, d2 = d3);
        }
        for (i = [0:n-1]) {
            rotate([0, 0, (i + 0.5) * 360/n]) translate([d/2, 0, -0.001]) cylinder(h = h + 0.002, d = d2);
        }        
    }  
    translate([0, -1, 0]) cube([d / 2, 2, h2]); 
}

module knob18(d, h, n){
    d2 = 3.14159*d/(2*n);
    difference() {
        union(){
            cylinder(h = h - 5, d = d);
            translate([0, 0, h - 5]) cylinder(h = 5, d1 = d, d2 = d - d2);
        }
        for (i = [0:n-1]) {
            rotate([0, 0, (i + 0.5) * 360/n]) translate([d/2, 0, -0.001]) cylinder(h = h + 0.002, d = d2);
        }
    }   
}


knob(30, 5, 8);
translate([0, 45, 0]) knob(30, 5, 6);
translate([0, 90, 0]) knob(30, 5, 3);
translate([0, -45, 0]) knob(30, 5, 16);
translate([0, -90, 0]) knob(30, 5, 32);

translate([45, 0, 0]) knob2(30, 5, 8);
translate([45, 45, 0]) knob2(30, 5, 6);
translate([45, 90, 0]) knob2(30, 5, 3);
translate([45, -45, 0]) knob2(30, 5, 16);
translate([45, -90, 0]) knob2(30, 5, 32);

translate([-45, 0, 0]) knob3(30, 5, 8);
translate([-45, 45, 0]) knob3(30, 5, 6);
translate([-45, 90, 0]) knob3(30, 5, 4);
translate([-45, -45, 0]) knob3(30, 5, 16);
translate([-45, -90, 0]) knob3(30, 5, 32);

translate([90, 0, 0]) knob12(30, 5, 8);
translate([90, 45, 0]) knob12(30, 5, 6);
translate([90, 90, 0]) knob12(30, 5, 4);
translate([90, -45, 0]) knob12(30, 5, 16);
translate([90, -90, 0]) knob12(30, 5, 32);

translate([135, 0, 0]) knob14(30, 20, 8);
translate([135, 45, 0]) knob14(30, 20, 6);
translate([135, 90, 0]) knob14(30, 20, 4);
translate([135, -45, 0]) knob14(30, 20, 16);
translate([135, -90, 0]) knob14(30, 20, 32);

translate([180, 0, 0]) knob15(30, 5, 8);
translate([180, 45, 0]) knob15(30, 5, 6);
translate([180, 90, 0]) knob15(30, 5, 4);
translate([180, -45, 0]) knob15(30, 5, 16);
translate([180, -90, 0]) knob15(30, 5, 32);

translate([225, 0, 0]) knob17(30, 20, 6);
translate([225, 45, 0]) knob17(30, 20, 8);
translate([225, 90, 0]) knob17(30, 20, 4);
translate([225, -45, 0]) knob17(30, 20, 16);
translate([225, -90, 0]) knob17(30, 20, 32);  

translate([270, 0, 0]) knob16(30, 20, 6);
translate([270, 45, 0]) knob16(30, 20, 8);
translate([270, 90, 0]) knob16(30, 20, 4);
translate([270, -45, 0]) knob16(30, 20, 16);
translate([270, -90, 0]) knob16(30, 20, 32);

translate([315, 0, 0]) knob18(30, 20, 6);
translate([315, 45, 0]) knob18(30, 20, 8);
translate([315, 90, 0]) knob18(30, 20, 4);
translate([315, -45, 0]) knob18(30, 20, 16);
translate([315, -90, 0]) knob18(30, 20, 32);

