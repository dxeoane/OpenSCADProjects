module panel(){
    cube([104, 18, 5], center=false);
    translate([104 - 20 + 8, 3, 5 + 0.7]) cube([20, 12, 3], center=false);
    translate([104 - 20 + 8, 3, 5]) cube([12, 12, 3], center=false);
    translate([-2,-2,0]) cube([2, 18, 15], center=false);
}

difference() {
    translate([104,18,0]) rotate([0, 0, 180]) panel();
    translate([104 /2 - 20,18 / 2,0]) cylinder(d = 6, h = 60, center = true, $fn=200); 
    translate([104 /2 + 20,18 / 2,0]) cylinder(d = 6, h = 60, center = true, $fn=200); 

    translate([104 /2 - 20,18 / 2,2+0.001]) cylinder(d = 11.5, h = 3, center = false, $fn=200); 
    translate([104 /2 + 20,18 / 2,2+0.001]) cylinder(d = 11.5, h = 3, center = false, $fn=200); 

    translate([104 - 5,15,7]) cube([10,30,5]);
    translate([104 - 7,-0.001,-0.001]) cube([12,4,20], center=false);
}
translate([104/2,18/2,5]) linear_extrude(height = 3) {
    text("PWR", size = 8, valign = "center", halign = "center", font = "Arial");
}
