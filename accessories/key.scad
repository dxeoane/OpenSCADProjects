// Shape. 0: L-Shape, 1:T-Shape
Shape = 0; // [0:1]
// This is the distance between the base of the triangle and the opposite vertex
Altitude = 9; // [6:0.5:24]
// This is the height of the cylinder
Height = 20; // [15:60]
// Positive values make the edge thicker by expanding the cylinder’s diameter, while negative values smooth the triangle’s corners.
Border = 1; // [-2:0.1:2]
// Specifies how much the cylinder’s diameter should be reduced.
Thinning = 0; // [0:0.1:2]

module key() {
    r = 2*Altitude/3;
    difference() {
        union() {
            cylinder(h = Height + 20, r = r + max(Border, 0) - Thinning, $fn=200);  
            for (i = [0:Shape]) {
                rotate([0, 0, i * 180])  hull(){
                    translate([0, 0, Height]) cylinder(h = 20, r = r + max(Border, 0), $fn=200);  
                    translate([40, 0, Height + 20 - 5]) cylinder(h = 5, d = 5, $fn=200);
                } 
            }            
        }
        translate([0, 0, -0.001]) intersection() {
            union() {
                cylinder(h = Height, r = r, $fn=3); 
                cylinder(h = 1, r1 = r + 1, r2 = r, $fn=3);            
            } 
            cylinder(h = Height + 20, r = r + Border, $fn=200);  
        }
    }
}

key();