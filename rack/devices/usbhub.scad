include <../front.scad>

x = 131;
y = 31;
z = 68;

module usbhub() {
    difference() {
        union(){
            front();
            translate([(254 - x - 4) / 2, (43.5 - y - 4) / 2, 0]) cube([(x + 4) / 2, y + 4, z + 2]);
        }        
        translate([(254 - x) / 2, (43.5 - y) / 2, -0.001]) cube([x, y, z]);
    }
}

difference() {
    union() {
        usbhub();
        translate([254 - 0.001,43.5,0]) rotate([0,0,180]) usbhub();
    }
    translate([254 - 80, 0, 10]) cube([50, 50, 70]);
}