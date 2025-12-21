module turn(diameter, height, width, segments) {
    angleStep = 360 / segments;
    r = diameter / 2;
    for (s = [0:segments]) {
        i = s;
        next_i = (s + 1) % segments;
        angle = i * angleStep;
        next_angle = next_i * angleStep;
        hull() {
            translate([ r * cos(angle), r * sin(angle), (i / segments) * height]) sphere(d=width, $fn=32);
            translate([ r * cos(next_angle), r * sin(next_angle), (s + 1) / segments * height]) sphere(d=width, $fn=32);
        }
    }   
}

module spiral(diameter, height, width, turns, segments) {
    turnHeight = height / turns;
    for (t = [0:turns-1]) {
        translate([0, 0, t * turnHeight]) 
            turn(diameter, turnHeight, width, segments);
    }
}

// d: diámetro interior del hilo. El diámetro exterior será d + w, y el dimaetro dek hueco d - w
// t: número de vueltas
// w: ancho del hilo
// hollow: si es verdadero, es hueco
// threadPlay: holgura. Desplazamiento axial entre macho y hembra
module male(d, t ,w, hollow=true, threadPlay=0){
    // Altura = vueltas * (ancho del hilo * sqrt(3) + holgura)
    h = t * (w * sqrt(3) + threadPlay);
    difference(){
        union() {
            cylinder(h = h, d = d, $fn=100);
            intersection(){
                spiral(diameter = d, height = h, width = w, turns = t, segments = 100);
                cylinder(h = h, d = d + 2 * w, $fn=100);
            }
        }  
        if (hollow) {
            translate([0, 0, -0.001]) cylinder(h = h + 0.002, d = d - w, $fn=100);           
        }
    }
}

module hmale(d, h, w, hollow=true, threadPlay=0){
    t = h / (w * sqrt(3) + threadPlay);
    intersection(){
        male(d,t+1,w,hollow, threadPlay);
        cylinder(h = h, d = d + 2 * w, $fn=100);
    }
}

// d: diámetro interior del hilo. El diámetro exterior será d + 2*w
// t: número de vueltas
// w: ancho del hilo
// threadPlay: holgura. Desplazamiento axial entre macho y hembra
module female(d,t,w,threadPlay=0){
    h = t * (w * sqrt(3) + threadPlay);
    difference(){
        cylinder(h = h, d = d + 2 * w, $fn=100);  
        translate([0, 0, -0.001]) cylinder(h = h + 0.002, d = d + w + 0.2, $fn=100);           
    }
    intersection(){
        spiral(diameter = d + w + 0.2, height = h, width = w, turns = t, segments = 100);
        cylinder(h = h, d = d + 2 * w, $fn=100);
    } 
}

module hfemale(d,h,w,threadPlay=0){
    t = h / (w * sqrt(3) + threadPlay);
    intersection(){
        female(d,t+1,w,threadPlay);
        cylinder(h = h, d = d + 2 * w, $fn=100);
    }
}

module knob(d, h, n){
    d2 = 3.14159*d/(2*n);
    difference() {
        union() {
            for (i = [0:n-1]) {
                rotate([0, 0, i * 360/n]) translate([d/2, 0, 0]) cylinder(h = h, d = d2, $fn=100);
            }
            cylinder(h = h, d = d);
        }
        for (i = [0:n-1]) {
                rotate([0, 0, (i + 0.5) * 360/n]) translate([d/2, 0, -0.001]) cylinder(h = h + 0.002, d = d2, $fn=100);
        }
    }   
}


// Tornillo con mango
module pieceA(){
    width = 5;
    height = 60;
    d = 20;

    translate([0, 0, 5 - 0.001]) hmale(d, height, width, true);
    for (i = [-1:2:1]){
        hull(){
            cylinder(h = 5, d = d + 20, $fn=100);
            translate([i * ((d + 20) / 2 + 5 + 20), 0, 0]) cylinder(h = 5, d = 10, $fn=100);
        }
    }
}

// Tornillo con estrias
module pieceA1(){
    width = 5;
    height = 30;
    d = 20;

    translate([0, 0, 5 - 0.001]) hmale(d, height, width, true);
    knob(40, 5, 6);
}

// Tapón con estrias
module pieceA2(){
    width = 5;
    height = 20;
    d = 20;

    translate([0, 0, 5 - 0.001]) hmale(d, height, width, true);
    knob(25, 5, 12);
}

// Rotnillo generico
module pieceA3(){
    width = 5;
    height = 30;
    d = 20;

    hmale(d, height, width, true);
}

// Cuerpo de una sola rosca
module pieceB(){
    width = 5;
    height = 20;
    d = 20;
    bigD = 90;
    archWidth = d + 2*width;

    hfemale(d, height, width);
    difference(){
        translate([0,0,bigD/2]) rotate([90,0,0]) cylinder(h = archWidth, d = bigD, $fn=100, center=true);
        translate([-bigD,-bigD/2,-1]) cube([bigD, bigD, bigD + 2]);
        cylinder(h = bigD + 2, d = 20 + 2*width, $fn=100);
        translate([0,0,bigD/2]) rotate([90,0,0]) cylinder(h = archWidth + 2, d = bigD - 2*15, $fn=100, center=true);
    }
    translate([0,0,bigD - height]) cylinder(h= height, d = d + 2*width, $fn=100);
    
}

// Cuerpo con doble rosca
module pieceC(){
    width = 5;
    height = 20;
    d = 20;
    bigD = 90;
    archWidth = d + 2*width;

    hfemale(d, height, width);
    difference(){
        translate([0,0,bigD/2]) rotate([90,0,0]) cylinder(h = archWidth, d = bigD, $fn=100, center=true);
        translate([-bigD,-bigD/2,-1]) cube([bigD, bigD, bigD + 2]);
        cylinder(h = bigD + 2, d = 20 + 2*width, $fn=100);
        translate([0,0,bigD/2]) rotate([90,0,0]) cylinder(h = archWidth + 2, d = bigD - 2*15, $fn=100, center=true);
    }
    translate([0,0,bigD - height]) hfemale(d, height, width);
    
}

// Punta para tapar el extremo de la rosca
module pieceD(){
    translate([0,0,5]) cylinder(h=20, d1=15, d2=13.5, $fn=100);
    cylinder(h=5, d=30, $fn=100);
}

pieceA3();