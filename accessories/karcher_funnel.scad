BigDiameter = 90;
SmallDiameter = 22;
Height = 50;
Deep = 30;

module funnel(){
    difference(){
        union(){
            cylinder(d1 = BigDiameter, d2 = SmallDiameter,  h = Height, center = false, $fn= 200);
            cylinder(d = SmallDiameter,  h = Height + Deep, center = false, $fn= 200);
        }        
        translate([0,0,-0.001]) cylinder(d1 = BigDiameter - 2, d2 = SmallDiameter - 2,  h = Height, center = false, $fn= 200);
        translate([0,0,-0.001]) cylinder(d = SmallDiameter - 2,  h = Height + Deep + 0.002, center = false, $fn= 200);        
    }
    difference() {
        union(){
            translate([-(SmallDiameter-2)/2 + 4 - 1,0,0]) cylinder(d = 8,  h = Height + Deep, center = false, $fn= 200);  
            hull() {
                translate([-(SmallDiameter-2)/2 + 4 - 1,0,0]) cylinder(d = 8,  h = Height, center = false, $fn= 200);  
                translate([-BigDiameter/2 - 5,0,0]) cylinder(d = 8,  h = 2, center = false, $fn= 200);
            }
        }
        translate([-(SmallDiameter-2)/2 + 4 - 1,0,-0.001]) cylinder(d = 8 - 2,  h = Height + Deep + 0.002, center = false, $fn= 200);   
        translate([-BigDiameter/2 - 5,0,-0.001]) cylinder(d = 6,  h = 10, center = false, $fn= 200);
    }
}

funnel();