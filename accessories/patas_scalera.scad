module patas(x,y,angulo){
    difference(){
        rotate([angulo,0,0]) translate([0,20,0]){
            cube([x,y,20]);
            translate([-10,-20,-80]) cube([x + 2 * 10, y + 2*20,80]);
        }
        translate([-50,-200,-100]) cube([100, 400,100]);
        translate([-50,0,-90]) cube([100, 10,100]);
        translate([-50,70,-20]) cube([100, 50,100]);
    }
}

// patas(19,47,22);
// patas(18,36,12);
patas(19,45,22);