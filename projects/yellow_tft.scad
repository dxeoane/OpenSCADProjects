border_to_hole = 4;
hole_distance_x = 78;
hole_distance_y = 42;
pcb_x = 2*border_to_hole + hole_distance_x;
pcb_y = 2*border_to_hole + hole_distance_y;
box_x = pcb_x + 10;
box_y = pcb_y + 10;
offset_pcb_x = (box_x - pcb_x) / 2;
offset_pcb_y = (box_y - pcb_y) / 2;
box_bottom_thickness = 2;
box_wall_thickness = 2;
box_height = 20;
hole_outer_diammeter = 6;
hole_bottom_diammeter = 16;
hole_inner_diammeter= 2.75;
hole_z = box_bottom_thickness + 12;
screen_cutout_offset_x = 15.5;
screen_cutout_offset_y = 6.5;
screen_cutout_x = 59;
screen_cutout_y = 46;

// Caja extendida para meter los conectores USB y de alimentación
box_extended_x = box_x + 40;
box_extended_y = box_y;
wire_cutout_diammeter = 16;
wire_cutout_offset_x = box_extended_x - box_wall_thickness - wire_cutout_diammeter/2 - 5;
wire_cutout_offset_y = box_wall_thickness + wire_cutout_diammeter/2 + 5;

// base
base_outer_diameter = 10;
base_height_increment = 10;;
base_width = box_extended_x  / 4;


module hole(){
    difference() {
        union() {
            cylinder(h = hole_z, d = hole_outer_diammeter, $fn = 100);
            cylinder(h = hole_z - 3, d1 = hole_bottom_diammeter, d2 = hole_outer_diammeter, $fn = 100);
        }
        translate([0,0,0.001]) cylinder(h = hole_z + 0.001, d = hole_inner_diammeter, $fn = 100);
    }
}

module box_holes(){
    for (x = [border_to_hole, border_to_hole + hole_distance_x]){
        for (y = [border_to_hole, border_to_hole + hole_distance_y]){
            translate([x + offset_pcb_x, y + offset_pcb_y, 0]) hole();
        }
    }
}

module box_with_reset(){
    difference() {
        union () {
            difference() {
                cube([box_x, box_y, box_height]);
                translate([box_wall_thickness, box_wall_thickness, box_bottom_thickness]) cube([box_x - 2*box_wall_thickness, box_y - 2*box_wall_thickness, box_height]);
                translate([box_x - box_wall_thickness - 0.001, box_wall_thickness + 20/2, box_bottom_thickness + 5]) cube([box_wall_thickness + 0.002, box_y - 2*box_wall_thickness - 20, box_height]);
            }
            box_holes();
        }
        // Agujero para el reset. Se puede quitar en el diseño final
        translate([offset_pcb_x + 11, offset_pcb_y + pcb_y - 6, -0.001]) cylinder(h = box_height + 0.002, d = 8, $fn = 100);
    }
}

module box(){
    union () {
        difference() {
            cube([box_x, box_y, box_height]);
            translate([box_wall_thickness, box_wall_thickness, box_bottom_thickness]) cube([box_x - 2*box_wall_thickness, box_y - 2*box_wall_thickness, box_height]);
            translate([box_x - box_wall_thickness - 0.001, box_wall_thickness + 20/2, box_bottom_thickness + 5]) cube([box_wall_thickness + 0.002, box_y - 2*box_wall_thickness - 20, box_height]);
        }
        box_holes();
    }
}


module cover(){
    difference() {
        cube([box_x + box_wall_thickness, box_y + 2 * box_wall_thickness, box_height + 2 * box_bottom_thickness]);
        // Le damos una holgura al cover para que entre sin problemas
        translate([box_wall_thickness, box_wall_thickness - 0.5/2, box_bottom_thickness - 0.5/2]) cube([box_x + 0.001, box_y + 0.5, box_height + 0.5]);
        translate([screen_cutout_offset_x + box_wall_thickness, screen_cutout_offset_y + box_wall_thickness, 3*box_bottom_thickness]) cube([screen_cutout_x, screen_cutout_y, box_height]);
    }
}

module box_extended(){
    union () {
        difference() {
            cube([box_extended_x, box_extended_y, box_height]);
            translate([box_wall_thickness, box_wall_thickness, box_bottom_thickness]) cube([box_extended_x - 2*box_wall_thickness, box_extended_y - 2*box_wall_thickness, box_height]);

        }
        for (x = [border_to_hole, border_to_hole + hole_distance_x]){
            for (y = [border_to_hole, border_to_hole + hole_distance_y]){
                translate([x + offset_pcb_x, y + offset_pcb_y, 0]) hole();
            }
        }
    }
}

module box_extended_with_wire_hole(){
    union () {
        difference() {
            cube([box_extended_x, box_extended_y, box_height]);
            translate([box_wall_thickness, box_wall_thickness, box_bottom_thickness]) cube([box_extended_x - 2*box_wall_thickness, box_extended_y - 2*box_wall_thickness, box_height]);
            translate([wire_cutout_offset_x, wire_cutout_offset_y, -0.001]) cylinder(h = box_bottom_thickness + 0.002, d = wire_cutout_diammeter, $fn = 100);

        }
        for (x = [border_to_hole, border_to_hole + hole_distance_x]){
            for (y = [border_to_hole, border_to_hole + hole_distance_y]){
                translate([x + offset_pcb_x, y + offset_pcb_y, 0]) hole();
            }
        }
    }
}

module box_extended_outline(){
    cube([box_extended_x, box_extended_y, box_height]);
}


module base1() {
    difference() {
        union() {
            difference(){
                translate([box_extended_x/2 + base_outer_diameter/2, 0, 0]) sphere(d = box_extended_x, $fn = 100);
                translate([box_extended_x/2 + base_outer_diameter/2 + 0.001, 0, -box_extended_x/2 - 0.001]) cylinder(h = box_extended_x/2 + 0.001, d = box_extended_x + 0.002, $fn = 100);
                rotate([60,0,0]) translate([box_extended_x/2 + base_outer_diameter/2 + 0.001, 0, 0]) cylinder(h = box_extended_x/2 + 0.001, d = box_extended_x + 0.002, $fn = 100);
            }
            rotate([60,0,0]) translate([base_outer_diameter/2, base_outer_diameter/2, 0]) {
                // Display
                difference() {
                    minkowski() {
                        box_extended_outline();
                        cylinder(h = base_height_increment, d = base_outer_diameter, $fn = 100);
                    }
                    translate([0,0,base_height_increment + 0.001]) box_extended_outline();
                }
                translate([0,0,base_height_increment]) box_extended();
            }
        }
        translate([0,0,40]) rotate([60,0,0]) translate([box_extended_x/2 + base_outer_diameter/2,0,0]) cylinder(h = 200, d = wire_cutout_diammeter, $fn = 200, center = true);
    }
}


module base2(){
    difference() {
        union() {
            hull() {
                rotate([150,0,0]) translate([(base_outer_diameter + box_extended_x - box_extended_x / 2)/2,  0, 0]) {
                    cube([box_extended_x / 2, box_height + base_height_increment, 0.001]);
                }
                translate([(base_outer_diameter + box_extended_x - base_width)/2, -(box_height + base_height_increment) * cos(30), -0.001]) cube([base_width, (box_height + base_height_increment) * cos(30), 0.001]);
            }
            hull() {
                rotate([60,0,0]) translate([base_outer_diameter/2, base_outer_diameter/2, 0]) {                    
                    minkowski() {
                        cube([box_extended_x, box_extended_y, 0.001]);
                        cylinder(h = 0.001, d = base_outer_diameter, $fn = 100);
                    }
                }
                translate([(base_outer_diameter + box_extended_x - base_width)/2,0,-0.001]) cube([base_width, (box_extended_y + base_outer_diameter) * cos(60), 0.001]);
            }
            rotate([60,0,0]) translate([base_outer_diameter/2, base_outer_diameter/2, 0]) {
                // Display
                difference() {
                    minkowski() {
                        box_extended_outline();
                        cylinder(h = base_height_increment, d = base_outer_diameter, $fn = 100);
                    }
                    translate([0,0,base_height_increment + 0.001]) box_extended_outline();
                }
                translate([0,0,base_height_increment]) box_extended();
            }
        }
        translate([0,0,40]) rotate([60,0,0]) translate([box_extended_x/2 + base_outer_diameter/2,0,0]) cylinder(h = 200, d = wire_cutout_diammeter, $fn = 200, center = true);
        // Agujero para el conector de antena
        translate([box_extended_x - box_wall_thickness + base_outer_diameter/2 - 0.001, -10, 20]) rotate([0,90,0]) 
          cylinder(h = box_wall_thickness + base_outer_diameter / 2 - 2, d = 12, $fn = 200, center = false);
        translate([box_extended_x - box_wall_thickness + base_outer_diameter/2 - 0.001, -10, 20]) rotate([0,90,0]) 
          cylinder(h = box_wall_thickness + base_outer_diameter / 2 + 0.002, d = 6.5, $fn = 200, center = false);
    }
}


module cover2(){
    difference() {
         minkowski() {
            cube([box_extended_x, box_extended_y, 1.2]);
            cylinder(h = 0.001, d = base_outer_diameter, $fn = 100);
        }
        translate([screen_cutout_offset_x, screen_cutout_offset_y, -0.001]) cube([screen_cutout_x, screen_cutout_y, 5]);
    }
    translate([box_wall_thickness + 0.2, box_wall_thickness + 0.2, -3]) difference() {
        cube([box_extended_x - 2 * box_wall_thickness - 0.4, box_extended_y - 2 * box_wall_thickness - 0.4, 3]);
        translate([1,1,-0.001]) cube([box_extended_x - 2 * box_wall_thickness - 0.4 - 2, box_extended_y - 2 * box_wall_thickness - 0.4 - 2, 3 + 0.002]);
    }
}

module tapon() {
    cylinder(h = 4, d1 = 7, d2 = 6.5 - 0.5, $fn = 100);
    cylinder(h = 2, d = 10, $fn = 100);
}


//cover2();
// box_extended();
// cover();
//base2();
tapon();
