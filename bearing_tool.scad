internal_diameter = 8;
external_diameter = 22;
height = 6;
handle = 10;

module tool(){
    difference(){
        union(){
            difference(){
                cylinder(h = handle, d = external_diameter + 2 + 0.5, $fn = 200);
                translate([0,0,-0.001]) cylinder(h = height + 0.001, d = external_diameter + 0.5, $fn = 200);        
            }
            translate([0,0,height - 1]) cylinder(h = 2, d = internal_diameter + 3, $fn = 200);
        }
        cylinder(h = handle + 1, d = internal_diameter + 1, $fn = 200);
    }
}

tool();