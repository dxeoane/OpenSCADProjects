difference(){
    cube([36,9.5,15]);
    for (i=[0:3]){
        translate([i*8 + 6,9.5/2,-1]){
            cylinder(d=7.1,h=22,$fn=200);
        }
    }
}