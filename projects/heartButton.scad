module flatHeart(size, height) {
  linear_extrude(height = height) {  
    square(size);
    translate([size / 2, size, 0]) circle(size / 2, $fn = 100);
    translate([size, size / 2, 0]) circle(size / 2, $fn = 100);
  }
}

module halfSphere(r) {
  intersection() {
    sphere(r, $fn = 100);
    cylinder(r = r, h = r, $fn = 100);
  }
}

module heart(size, height){
    minkowski() {
        flatHeart(size, height);
        halfSphere(size / 2);
    }
}

module heartWithCuts(size, height){
    // Coranzon hueco
    difference() {
        difference() {
            union() {
                heart(size, height);
                translate([0,50,5]) rotate([-90,0,0]) cylinder(d = 6, h = 10, $fn = 100);
            }
            translate([2, 2, - 2]) heart(size - 2, height + 2);
        }
        translate([0,51,5]) rotate([-90,0,0]) cylinder(d = 4, h = 12, $fn = 100);
        difference() {
            translate([size, size / 2, -1]) cylinder(r = size / 2, h = 52, $fn = 100);
            translate([size, size / 2, -1]) cylinder(r = (size / 2) - 0.5, h = 52, $fn = 100);
            translate([0, 0, -1]) cube([size,size,52]);
        }
    }
    // Soporte de los tornillos
    for (p = [[-6.5,-6.5,0], [size,-10,0], [-10,size,0], [size + 26,-10 + 26,0], [-10 + 26,size + 26,0]]) {
        translate(p) difference() {
            cylinder(d = 6, h = 10, $fn = 100);
            translate([0, 0, -1]) cylinder(d = 3, h = 12, $fn = 100);
        }
    }
    // Separador
    translate([-2, 0, 0]) cube([2,size,size/2 + height - 1]);
    translate([size - 2, -1, 0]) cube([2,size + 2,size/2 + height - 1]);

      
}

module lid(size, height){
    difference(){
        minkowski() {
            flatHeart(size, 2);
            cylinder(r = size / 2, h = 2, $fn = 100);
        }  
        for (p = [[-6.5,-6.5,-1], [size,-10,-1], [-10,size,-1], [size + 26,-10 + 26,-1], [-10 + 26,size + 26,-1]]) {
            translate(p) cylinder(d = 3, h = 10, $fn = 100);
            translate(p) cylinder(d = 6, h = 4, $fn = 100);
        }
    }

    // Soporte interruptor
    translate([size + 5, (size - 17) / 2, 4]) difference(){
        cube([6 + 4, 13 + 4,size/2 + height - 3]);
        translate([2, 2, 0]) cube([6,13,size/2 + height]);
        translate([2 - 3, 2, 0]) cube([12, 13 , 2]);
        translate([2 - 3, 2 + 2, 0]) cube([12,9,size/2 + height]);
    }
    difference() {
        translate([size + 5 + 6 + 13/2 + 1,(size - 15) / 2,size/2 + height - 7]) rotate([0,90,90]) difference() {
            cylinder(d = 10, h = 15, $fn = 100);
            translate([0,0,-1]) cylinder(d = 3, h = 17, $fn = 100);
            translate([0,0,-1]) cylinder(d = 6, h = 5, $fn = 100);
        }  
        translate([size + 5 + 2 - 3, (size - 17) / 2 + 2 + 2 + 2, 0]) cube([30,2,size/2 + height]);
        for (p = [[-6.5,-6.5,0], [size,-10,0], [-10,size,0], [size + 26,-10 + 26,0], [-10 + 26,size + 26,0]]) {
            translate(p) cylinder(d = 8, h = 50, $fn = 100);
        }
    }
}


heartWithCuts(30, 5);
translate([0,0,-2]) 
lid(30, 5);