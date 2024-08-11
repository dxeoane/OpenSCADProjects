

module cap(){
    difference() {
        cube([30, 11.4 + 4, 4.2 + 4]);
        translate([-0.001, 2, 2]) cube([30 + 0.002, 11.4, 4.2]);
    }
    cube([5, 40, 4.2 + 4]);
}

cap();