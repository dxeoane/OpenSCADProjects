// Size of the die
Size = 20;
// Set the font size for the numbers on the die. 0 to disable.
FontSize = 12;
// Define the numbers to be used on the die faces
Num1 = "1";
Num2 = "2";
Num3 = "3";
Num4 = "4";
Num5 = "5";
Num6 = "6";

module number(n){
    linear_extrude(height = 1) {
        text(n, size = FontSize, valign = "center", halign = "center", font = "Arial");
    }
}

module dado(){
    difference() {
        intersection(){
            cube([Size, Size, Size], center=true);
            sphere(r=Size/(2*sin(45)), $fn=100);
        }
        if (FontSize > 0) {
            translate([0, 0, Size/2 - 1 + 0.001]) number(Num1);
            rotate([0,90,0]) translate([0, 0, Size/2 - 1 + 0.001]) number(Num2);
            rotate([0,180,0]) translate([0, 0, Size/2 - 1 + 0.001]) number(Num6);
            rotate([0,270,0]) translate([0, 0, Size/2 - 1 + 0.001]) number(Num5);
            rotate([90,0,0]) translate([0, 0, Size/2 - 1 + 0.001]) number(Num3);
            rotate([-90,0,0]) translate([0, 0, Size/2 - 1 + 0.001]) number(Num4);
        }
    }
}

dado();