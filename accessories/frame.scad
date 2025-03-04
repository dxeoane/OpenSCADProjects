// Internal width
Width = 85; // [30:150]
// Internal height
Height = 55; // [30:150]

// Stand width. 0 for no stand
Stand = 30;
// With hole for screw
WithHole = true;

// With top border
WithTopBorder = false;

module frame() {
    WidthAndBorder = Width + 6;
    HeightAndBorder = Height + 3;
    difference() {
        union() {            
            cube([WidthAndBorder,3,HeightAndBorder]);
            cube([WidthAndBorder,6,5]);       
            if (WithTopBorder) {
                translate([0,0,HeightAndBorder - 5]) cube([WidthAndBorder,6,5]);
            }
            cube([5,6,HeightAndBorder]);  
            translate([WidthAndBorder - 5,0,0]) cube([5,6,HeightAndBorder]);     
            if (Stand > 0) {
                translate([0,-Stand/2,0]) cube([WidthAndBorder,Stand,5]);
            }  
        }
        translate([3,3,3]) cube([Width,1,HeightAndBorder]);
        if (WithHole) {
            translate([WidthAndBorder/2,-0.1,HeightAndBorder-20]) rotate([-90,0,0]) 
                cylinder(d = 15 - 0.1, h = 3 + 0.2, $fn = 100); 
        }
    }
    if (WithHole) {
        translate([WidthAndBorder/2,0,HeightAndBorder-20]) rotate([-90,0,0]) 
            difference(){  
                cylinder(d = 15, h = 3, $fn = 100);
                translate([0,0,-0.1]) cylinder(d1 = 3.5, d2 = 8, h = 3.2, $fn = 100);
            }
    }    
}

frame();

