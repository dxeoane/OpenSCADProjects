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

module hole(){
    difference() {
        union() {
            cylinder(h = hole_z, d = hole_outer_diammeter, $fn = 100);
            cylinder(h = hole_z - 3, d1 = hole_bottom_diammeter, d2 = hole_outer_diammeter, $fn = 100);
        }
        translate([0,0,0.001]) cylinder(h = hole_z + 0.001, d = hole_inner_diammeter, $fn = 100);
    }
}

module box(){
    difference() {
        union () {
            difference() {
                cube([box_x, box_y, box_height]);
                translate([box_wall_thickness, box_wall_thickness, box_bottom_thickness]) cube([box_x - 2*box_wall_thickness, box_y - 2*box_wall_thickness, box_height]);
                translate([box_x - box_wall_thickness - 0.001, box_wall_thickness + 20/2, box_bottom_thickness + 5]) cube([box_wall_thickness + 0.002, box_y - 2*box_wall_thickness - 20, box_height]);
            }
            for (x = [border_to_hole, border_to_hole + hole_distance_x]){
                for (y = [border_to_hole, border_to_hole + hole_distance_y]){
                    translate([x + offset_pcb_x, y + offset_pcb_y, 0]) hole();
                }
            }
        }
        // Agujero para el reset. Se puede quitar en el diseño final
        translate([offset_pcb_x + 11, offset_pcb_y + pcb_y - 6, -0.001]) cylinder(h = box_height + 0.002, d = 8, $fn = 100);
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

// box();
cover();