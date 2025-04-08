// External diameter of the big end
BigDiameter = 90; // [15:150]
// External diameter of the small end
SmallDiameter = 22; // [15:90]
// Height of the big end
Height = 50; // [15:90] 
// Height of the small end
Deep = 30; // [15:90]

module funnel(){
    difference(){
        union(){
            difference(){
                union(){
                    cylinder(d1 = BigDiameter, d2 = SmallDiameter,  h = Height, center = false, $fn= 200);
                    cylinder(d = BigDiameter + 5,  h = 2, center = false, $fn= 200);
                    cylinder(d = SmallDiameter,  h = Height + Deep, center = false, $fn= 200);
                }        
                translate([0,0,-0.001]) cylinder(d1 = BigDiameter - 2, d2 = SmallDiameter - 2,  h = Height, center = false, $fn= 200);
                translate([0,0,-0.001]) cylinder(d = SmallDiameter - 2,  h = Height + Deep + 0.002, center = false, $fn= 200);        
            }
            difference() {
                union(){
                    translate([-(SmallDiameter-2)/2 + 3,0,0]) cylinder(d = 8,  h = Height + Deep, center = false, $fn= 200);  
                    hull() {
                        translate([-(SmallDiameter-2)/2 + 3,0,0]) cylinder(d = 8,  h = Height, center = false, $fn= 200);  
                        translate([-BigDiameter/2,0,0]) cylinder(d = 8,  h = 2, center = false, $fn= 200);
                    }
                }
                translate([-(SmallDiameter-2)/2 + 3,0,-0.001]) cylinder(d = 8 - 2,  h = Height + Deep + 0.002, center = false, $fn= 200);          
            }
        }
        translate([0,0,Height + Deep - SmallDiameter * tan(15) / 2]) rotate([0,15,0]) cylinder(d = BigDiameter + 5,  h = Deep, center = false, $fn= 200);
    }
}

funnel();