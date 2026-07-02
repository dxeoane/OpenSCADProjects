

BOX_X = 120;
BOX_Y = 60;
BOX_Z = 10;
WALL_THICKNESS = 2;

OUTER_X = BOX_X + WALL_THICKNESS * 2;
OUTER_Y = BOX_Y + WALL_THICKNESS * 2;
OUTER_Z = BOX_Z + WALL_THICKNESS;

POLE_DIAMETER = 8;
HOLE_DIAMETER = 2.5;
SCREW_HEAD_DIAMETER = POLE_DIAMETER - 2;

// HOLE_DIAMETER = 2.5;
// POLE_DIAMETER = HOLE_DIAMETER * 3 + 2;

WIRE_DIAMETER = 5;

GRILLE_WIDTH_X = 2;

POLES = [
    [POLE_DIAMETER/2,POLE_DIAMETER/2],
    [BOX_X/2,POLE_DIAMETER/2],
    [BOX_X - POLE_DIAMETER/2,POLE_DIAMETER/2],
    [POLE_DIAMETER/2,BOX_Y - POLE_DIAMETER/2],
    [BOX_X/2,BOX_Y - POLE_DIAMETER/2],
    [BOX_X - POLE_DIAMETER/2,BOX_Y - POLE_DIAMETER/2]
];

CLAMP_POLES = [
    [POLE_DIAMETER/2 + 5,BOX_Y/2 - POLE_DIAMETER/2 - WIRE_DIAMETER / 2],
    [POLE_DIAMETER/2 + 5,BOX_Y/2 + POLE_DIAMETER/2 + WIRE_DIAMETER / 2]
];

AUX_POLES = [
    [POLE_DIAMETER * 2,POLE_DIAMETER],
    [BOX_X/2 + POLE_DIAMETER,POLE_DIAMETER],
    [BOX_X/2 - POLE_DIAMETER,POLE_DIAMETER],
    [BOX_X - POLE_DIAMETER * 2,POLE_DIAMETER],
    [POLE_DIAMETER * 2,BOX_Y - POLE_DIAMETER],
    [BOX_X/2 + POLE_DIAMETER,BOX_Y - POLE_DIAMETER],
    [BOX_X/2 - POLE_DIAMETER,BOX_Y - POLE_DIAMETER],
    [BOX_X - POLE_DIAMETER * 2,BOX_Y - POLE_DIAMETER]
];

WEDGES_BOTTOM = [
    [BOX_X / 8, 0],
    [2 * BOX_X / 8, 0],
    [3 * BOX_X / 8, 0],    
    [5 * BOX_X / 8, 0],
    [6 * BOX_X / 8, 0],
    [7 * BOX_X / 8, 0],
];

WEDGES_TOP = [
    [BOX_X / 8, BOX_Y - WALL_THICKNESS],
    [2 * BOX_X / 8, BOX_Y - WALL_THICKNESS],
    [3 * BOX_X / 8, BOX_Y - WALL_THICKNESS],    
    [5 * BOX_X / 8, BOX_Y - WALL_THICKNESS],
    [6 * BOX_X / 8, BOX_Y - WALL_THICKNESS],
    [7 * BOX_X / 8, BOX_Y - WALL_THICKNESS],    
];

WEDGES_LEFT = [
    [0, 2 * BOX_Y / 8],
    [0, 3 * BOX_Y / 8],    
    [0, 5 * BOX_Y / 8],
    [0, 6 * BOX_Y / 8]
];

WEDGES_RIGHT = [
    [BOX_X - WALL_THICKNESS, 2 * BOX_Y / 8],
    [BOX_X - WALL_THICKNESS, 3 * BOX_Y / 8],    
    [BOX_X - WALL_THICKNESS, 5 * BOX_Y / 8],
    [BOX_X - WALL_THICKNESS, 6 * BOX_Y / 8],  
];

module box(){
    difference() {
        cube([OUTER_X, OUTER_Y, OUTER_Z]);
        translate([WALL_THICKNESS, WALL_THICKNESS, WALL_THICKNESS]) cube([BOX_X, BOX_Y, BOX_Z + 0.001]);
        translate([0,OUTER_Y/2, OUTER_Z]) rotate([0,90,0]) cylinder(h = 3 * WALL_THICKNESS, d = WIRE_DIAMETER, $fn=100, center = true);
    }
}

module poles(){
   translate([WALL_THICKNESS, WALL_THICKNESS, WALL_THICKNESS]) {
        for (p = POLES) {
            difference() {
                translate(p) cylinder(h = BOX_Z - 0.5, d = POLE_DIAMETER, $fn=100);
                translate(p) cylinder(h = BOX_Z - 0.5 + 0.001, d = HOLE_DIAMETER, $fn=100);
            }
        }
   } 
}

module clamp_poles(){
   translate([WALL_THICKNESS, WALL_THICKNESS, WALL_THICKNESS]) {
        difference() {
            union() {
                for (p = CLAMP_POLES) {
                    translate(p) cylinder(h = BOX_Z - 0.5, d = POLE_DIAMETER, $fn=100);
                }
                hull() {
                    for (p = CLAMP_POLES) {
                        translate(p) cylinder(h = BOX_Z - 0.5 - WIRE_DIAMETER/2, d = POLE_DIAMETER, $fn=100);
                    }
                }
            }
            for (p = CLAMP_POLES) {
                translate(p) cylinder(h = BOX_Z - 0.5 + 0.001, d = HOLE_DIAMETER, $fn=100);
            }        
        }
   } 
}

module aux_poles(){
   translate([WALL_THICKNESS, WALL_THICKNESS, WALL_THICKNESS]) {
        for (p = AUX_POLES) {
            difference() {
                translate(p) cylinder(h = BOX_Z - 0.5, d = POLE_DIAMETER, $fn=100);
                translate(p) cylinder(h = BOX_Z - 0.5 + 0.001, d = HOLE_DIAMETER, $fn=100);
            }
        }
   } 
}

module holes(){
   translate([WALL_THICKNESS, WALL_THICKNESS, -0.001]) {
        for (p = POLES) {
            translate(p) cylinder(h = BOX_Z - 0.5, d = SCREW_HEAD_DIAMETER, $fn=100);
        }
   } 
}

module wedge_bottom(){
    translate([WALL_THICKNESS,0,0]) rotate([0,-90,0]) linear_extrude(height = WALL_THICKNESS, center = false, convexity = 10) {
        polygon(points=[[0,0],[0,WALL_THICKNESS], [BOX_Z + WALL_THICKNESS,WALL_THICKNESS], [BOX_Z + 0.5,0]]);
    } 
}

module wedge_top(){
    translate([0,WALL_THICKNESS,0]) rotate([0,-90,180]) linear_extrude(height = WALL_THICKNESS, center = false, convexity = 10) {
        polygon(points=[[0,0],[0,WALL_THICKNESS], [BOX_Z + WALL_THICKNESS,WALL_THICKNESS], [BOX_Z + 0.5,0]]);
    } 
}

module wedge_right(){
    translate([WALL_THICKNESS,WALL_THICKNESS,0]) rotate([0,-90,90]) linear_extrude(height = WALL_THICKNESS, center = false, convexity = 10) {
        polygon(points=[[0,0],[0,WALL_THICKNESS], [BOX_Z + WALL_THICKNESS,WALL_THICKNESS], [BOX_Z + 0.5,0]]);
    } 
}

module wedge_left(){
    rotate([0,-90,-90]) linear_extrude(height = WALL_THICKNESS, center = false, convexity = 10) {
        polygon(points=[[0,0],[0,WALL_THICKNESS], [BOX_Z + WALL_THICKNESS,WALL_THICKNESS], [BOX_Z + 0.5,0]]);
    } 
}

module wedges(){
   translate([WALL_THICKNESS, WALL_THICKNESS, WALL_THICKNESS]) {
        for (p = WEDGES_BOTTOM) {
           translate(p) wedge_bottom();
        }
        for (p = WEDGES_TOP) {
           translate(p) wedge_top();
        }
        for (p = WEDGES_LEFT) {
           translate(p) wedge_left();
        }
        for (p = WEDGES_RIGHT) {
           translate(p) wedge_right();
        }
   } 
}

module wedges_b(){
   translate([WALL_THICKNESS, WALL_THICKNESS, WALL_THICKNESS]) {
        translate([WALL_THICKNESS + 1, 0, 0]) for (p = WEDGES_BOTTOM) {
           translate(p) wedge_bottom();
        }
        translate([WALL_THICKNESS + 1, 0, 0]) for (p = WEDGES_TOP) {
           translate(p) wedge_top();
        }
        translate([0, WALL_THICKNESS + 1, 0]) for (p = WEDGES_LEFT) {
           translate(p) wedge_left();
        }
        translate([0, WALL_THICKNESS + 1, 0]) for (p = WEDGES_RIGHT) {
           translate(p) wedge_right();
        }
   } 
}

module grille(){
    translate([WALL_THICKNESS, WALL_THICKNESS, 0]) {
        translate([0, 6 * WALL_THICKNESS, -0.001]) {
            for (i = [0:2*GRILLE_WIDTH_X:32*GRILLE_WIDTH_X]) {
                translate([(BOX_X - 16 * GRILLE_WIDTH_X)/2 + i, 0, 0]) cube([GRILLE_WIDTH_X, BOX_Y - 12 * WALL_THICKNESS, BOX_Z]);
            }            
        }
    }
}

module box_a(){
    difference(){
        box();
        grille();
    }
    poles();
    wedges(); 
}

module box_b(){
    difference() {
        union() {
            box();
            poles();
            clamp_poles();
            aux_poles();
            wedges_b(); 
        }
        holes();
    }    
}

module stripe(distance) {
    difference() {
        hull() {
            cylinder(h = WALL_THICKNESS, d = POLE_DIAMETER, $fn=100);
            translate([0, distance, 0]) cylinder(h = WALL_THICKNESS, d = POLE_DIAMETER, $fn=100);
        }
        translate([0, 0, -0.001]) cylinder(h = WALL_THICKNESS + 0.002, d = HOLE_DIAMETER + 1, $fn=100);
        translate([0, distance, -0.001]) cylinder(h = WALL_THICKNESS + 0.002, d = HOLE_DIAMETER + 1, $fn=100);
    }    
}

module stripe_a() {
    stripe(BOX_Y - 2 * POLE_DIAMETER);
}

module stripe_b() {
    stripe(POLE_DIAMETER + WIRE_DIAMETER);
    translate([-POLE_DIAMETER/2, (POLE_DIAMETER + WIRE_DIAMETER - 3)/2, 0]) cube([POLE_DIAMETER, 3, WALL_THICKNESS * 2]);
}

// box_a();
box_b();
// stripe_a(); translate([20, 0, 0]) stripe_a(); translate([40, 0, 0]) stripe_b();

