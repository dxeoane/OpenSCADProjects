include <front.scad>

t = 5;

module tray() {
    translate([-254 / 2, 0, 0]) difference(){
        union() {
            front();
            translate([0, 43.5, 0]) front();
            translate([16, 0, 0]) cube([(254 / 2) - 16, 43.5, 180]);    
            translate([16, 43.5, 0]) cube([t, 43.5, 180]);  
            translate([16, 43.5, 180 - 5]) cube([(254 / 2) - 16, 20, t]);   
        }
        translate([16 + t, t, -0.001]) cube([(254 / 2) - 16 - t - t - t, 43.5 - t - t, 180 + 0.002]);
        translate([16 + t, 43.5, -0.001]) cube([(254 / 2) - 16 - t + 0.001, 43.5 + 0.001, 20 + 0.002]);
    }  
}

union() {
    tray();
    mirror([1,0,0]) tray();
}