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

// Tornillo sin holgura y con la altura determinada por el número de vueltas
module thread_example() {
    width = 5;
    turns = 4;
    d = 20;

    translate([60, 0 ,0]) {
        knob(40, 5, 6);
        translate([0, 0, 5 - 0.001]) male(d, turns, width, true);
    }

    knob(40, 5, 6);
    translate([0, 0, 5 - 0.001]) female(d, turns, width);
}

// Tornillo sin holgura y el numero de vueltas determinado por la altura
module thread_example2() {
    width = 5;
    height = 40;
    d = 20;

    translate([60, 0 ,0]) {
        knob(40, 5, 6);
        translate([0, 0, 5 - 0.001]) hmale(d, height, width, true);
    }

    knob(40, 5, 6);
    translate([0, 0, 5 - 0.001]) hfemale(d, height, width);
}


// Tornillo con una holgura exagerada para mostrar el efecto
module thread_example3() {
    width = 5;
    height = 40;
    d = 20;

    translate([60, 0 ,0]) {
        knob(40, 5, 6);
        translate([0, 0, 5 - 0.001]) hmale(d, height, width, true, 10);
    }

    knob(40, 5, 6);
    translate([0, 0, 5 - 0.001]) hfemale(d, height, width, 10);
}

thread_example3();