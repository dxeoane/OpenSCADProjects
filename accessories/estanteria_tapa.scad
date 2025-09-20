module canal(){
    cube([40,19.9,8.5]);    
}

module anclajes(){
    translate([55,-19.9 / 2,-8.5]) canal();
    rotate([0,-90,0]) translate([55,-19.9 / 2,0]) canal();
}

module arco(){
    intersection(){
        difference(){
            cylinder(h=8,r=90,$fn=200);
            translate([0,0,-0.001]) cylinder(h=8 + 0.002,r=60,$fn=200);
        }
        cube([120,120,20]);
    }
}

rotate([90,0,0]) translate([0,0,-8/2]) arco();
anclajes();



