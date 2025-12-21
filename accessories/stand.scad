module stand(){
    cylinder(d = 60, h = 5, $fn=100);
    translate([-40/2,-1 -3,0]) cube([40,3,15]);
    translate([-40/2,1,0]) cube([40,3,15]);
}

stand();