module keystone() {
    w = 25;
    h = 25;
    difference() {        
      cube([w, 9.90, h + 2]);
      translate([(w-14.60)/2, -0.001, (h-16.30)/2]) cube([14.60, 9.90 + 0.002, 16.30 + 0.6]);
      translate([(w-14.60)/2, 5, (h-16.30)/2]) cube([14.60, 9.90 - 5 + 0.002, 19.5 + 0.6]);
      translate([(w-14.60)/2, 8.30 - 7, (h-16.30)/2 - 2]) cube([14.60, 7, 19.05 + 2 + 2 + 2]);
    }
}

module keystoneCut(l = 9.90 + 0.002){
    w = 25;
    h = 25;
    cube([w, l, h + 2]);    
}

// keystone();