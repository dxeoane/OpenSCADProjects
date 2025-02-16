include <./front.scad>

SizeX = 95;
SizeY = 110;
SizeZ = 15;
Thickness = 1.5;
HolesX = 85;
HolesY = 80;
HolesZ = 3;
ScrewY = 10;
ScrewZ = 15;

module bottom(){
    difference(){
        translate([-Thickness, -Thickness, -Thickness]) cube([SizeX + 2*Thickness, SizeY + 2*Thickness, SizeZ + Thickness]);
        cube([SizeX, SizeY, SizeZ + Thickness]);
        translate([(SizeX - HolesX) / 2 + 7, - Thickness - 0.001, 0]) cube([70, 2 * Thickness, SizeZ + 0.001]);
        translate([(SizeX - HolesX) / 2 + 7, SizeY - 0.001, 0]) cube([32, 2 * Thickness, SizeZ + 0.001]);
    }
    // Soportes de la placa
    for (p = [
        [(SizeX - HolesX) / 2, (SizeY - HolesY) / 2, 0],
        [(SizeX - HolesX) / 2 + HolesX, (SizeY - HolesY) / 2, 0],
        [(SizeX - HolesX) / 2, (SizeY - HolesY) / 2 + HolesY, 0],
        [(SizeX - HolesX) / 2 + HolesX, (SizeY - HolesY) / 2 + HolesY, 0]
    ]) translate(p) {
        cylinder(d = 6, h = HolesZ, center = false, $fn = 100);
        translate([0,0,HolesZ - 0.001]) cylinder(d1 = 4, d2 = 2, h = HolesZ, center = false, $fn = 100);        
    }  
    // Roscas de los tornillos
    for (p = [
        [(SizeX - HolesX) / 2, (SizeY - HolesY) / 2 - ScrewY, 0],
        [(SizeX - HolesX) / 2 + HolesX, (SizeY - HolesY) / 2 - ScrewY, 0],
        [(SizeX - HolesX) / 2, (SizeY - HolesY) / 2 + HolesY + ScrewY, 0],
        [(SizeX - HolesX) / 2 + HolesX, (SizeY - HolesY) / 2 + HolesY + ScrewY, 0]
    ]) translate(p) {
        difference() {
            cylinder(d = 10, h = ScrewZ, center = false, $fn = 100); 
            translate([0,0,Thickness]) cylinder(d = 2, h = ScrewZ, center = false, $fn = 100); 
        }   
    } 
}

module bottomAndFront(){
    difference(){
        union(){
            translate([-20,-10,40]) rotate([270,0,0]) front2();
            bottom();
        }
        translate([(SizeX - HolesX) / 2 + 7, -15, 0]) cube([70, 30, SizeZ + 0.001]);
    }
}

module cover(){
    difference() {
        union() {
            cube([69.5, 14.5, 22]);
            translate([-0.5,4.5,20.5]) cube([69.5 + 1, 10, 1.5]);
            translate([(69.5 - 80)/2, 0, 0]) cube([80, 14.5 + 3, 10]);
        }
        translate([2,2,2]) cube([69.5 - 4, 20, 22]);
    }
}

module top(){
    topSizeZ = 8;
    screws = [
        [(SizeX - HolesX) / 2, (SizeY - HolesY) / 2 - ScrewY, 1],
        [(SizeX - HolesX) / 2 + HolesX, (SizeY - HolesY) / 2 - ScrewY, 1],
        [(SizeX - HolesX) / 2, (SizeY - HolesY) / 2 + HolesY + ScrewY, 1],
        [(SizeX - HolesX) / 2 + HolesX, (SizeY - HolesY) / 2 + HolesY + ScrewY, 1],
    ];
    pins = [
        [(SizeX - HolesX) / 2 + 5, (SizeY - HolesY) / 2 + 10, -10],
        [(SizeX - HolesX) / 2 + HolesX - 5, (SizeY - HolesY) / 2 + HolesY - 5, -10]
    ];

    difference(){
        union() {
            difference(){
                translate([-Thickness, -Thickness, 0]) cube([SizeX + 2*Thickness, SizeY + 2*Thickness, topSizeZ + Thickness]);
                translate([0,0,-0.001])cube([SizeX, SizeY, topSizeZ]);
            }
            // Base de los tornillos
            for (p = screws) translate(p) cylinder(d = 10, h = topSizeZ - 1, center = false, $fn = 100);  
            for (p = pins) translate(p) cylinder(d = 10, h = topSizeZ + 10, center = false, $fn = 100);
        }
        for (p = screws) translate(p) {
            translate([0,0,-0.001]) cylinder(d = 4, h = topSizeZ + 1 + 0.001, center = false, $fn = 100);
            translate([0,0,2]) cylinder(d = 6.5, h = topSizeZ + 1, center = false, $fn = 100);
        }
        translate([-Thickness - 0.001, -Thickness - 0.001 - 1, -0.001]) cube([SizeX + 2*Thickness + 0.002, 2*Thickness + 0.002, topSizeZ + Thickness + 0.002]);
        intersection() {
            for (i = [1:16]) translate([-4.5 + SizeX * i / 16, 10 / 2, 1]) cube([3, SizeY - 10, topSizeZ + Thickness + 20], center = false);
            translate([SizeX/2, SizeY/2, 0]) cylinder(d = SizeX/2, h = topSizeZ + Thickness + 20, center = false, $fn = 100);
        }
        // Recortes para apretar los tornillos
        translate([(SizeX - HolesX) / 2 + 7, - Thickness - 0.001 + 10, -0.001]) cube([70, 2 * Thickness + 8, SizeZ + 0.002]);
        translate([(SizeX - HolesX) / 2 + 7, SizeY - 0.001 - 18, -0.001]) cube([32, 2 * Thickness + 8, SizeZ + 0.002]);
        
    }
    translate([0,SizeY / 4,-Thickness]) cube([Thickness, SizeY / 2, topSizeZ + 2*Thickness]);
    translate([SizeX - Thickness,SizeY / 4,-Thickness]) cube([Thickness, SizeY / 2, topSizeZ + 2*Thickness]);
    translate([50, SizeY - Thickness,-Thickness]) cube([30, Thickness, topSizeZ + 2*Thickness]);   

}

bottomAndFront();

