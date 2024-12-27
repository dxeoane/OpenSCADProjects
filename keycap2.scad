bottomX = 18;
bottomY = 18;
topX = 13;
topY = 14;

height = 10;
chamfer = 2;

module base() {
    difference() {
        hull() {
            cube([bottomX - 2*chamfer, bottomY - 2*chamfer, 0.001]);
            translate([(bottomX - topX) / 2, bottomY - topY, height - chamfer]) cube([topX - 2*chamfer, topY - 2*chamfer, 0.001]);
        }        
    }
}

module cap() {
    difference() {
        minkowski() {
            base();
            sphere(r = chamfer, $fn = 200);
        }  
        translate([0,0,-0.001]) base();
        translate([-chamfer, -chamfer, -2*chamfer])cube([bottomX, bottomY, 2*chamfer]);
    }
      
}

// Este es el poste que conecta la tecla con el interruptor
module pole() {
    crossX = 4;
    crossY = 1.4.;
    h = height;
    difference() { 
        intersection() {
            translate([0, 0, h / 2]) cube([6, 5 - 0.01, h], center = true);
            translate([0, 0, h / 2]) cylinder(h = h, r = 3, center = true, $fn = 200);
        }
        // Aqui recortamos la cruz donde encaja es interrurptor
        translate([0, 0,(h / 2) - 0.01]) cube([crossX, crossY, h], center = true);
        rotate([0, 0, 90]) translate([0, 0,(h / 2) - 0.01]) cube([crossX, crossY, h], center = true);       
    }
}


cap();
translate([bottomX/2 - chamfer, bottomY/2 - chamfer, 0]) pole();
translate([(bottomX - topX)/2, bottomY - 2*chamfer, height]) 
linear_extrude(1/2) text("Esc", size = 3, font = "JetBrains Mono:style=Bold", valign = "top", $fn = 200);