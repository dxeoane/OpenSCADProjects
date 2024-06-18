
space = 0.4;
border = 2;

module elevatedKnuckle(d, w, hole = true){
  difference() {
    hull(){
        cylinder(d = d + 2*border, h = w - space, $fn = 64, center = false);
        translate([(d+2*border)/2 + border, (d+2*border)/2 + border, 0]) cube([d + 2*border, border, w - space]);
    }
    if (hole) translate([0, 0, -0.001]) cylinder(d = d, h = w + 0.002, $fn = 100, center = false);
  }
}

module knuckle(d, w, hole = true){
  difference() {
    hull(){
        cylinder(d = d + 2*border, h = w - space, $fn = 64, center = false);
        translate([(d+2*border)/2, border, 0]) cube([d + 2*border, border, w - space]);
    }
    if (hole) translate([0, 0, -0.001]) cylinder(d = d, h = w + 0.002, $fn = 100, center = false);
  }
}

module leaf(d, w, n, elevated = false, hole = true) {
  for (i = [0:n-1]) {
      translate([0,0,2*i*w]) if (elevated) elevatedKnuckle(d, w, hole); else knuckle(d, w, hole);
  }
}

module left_leaf(d, w, n, elevated = false, hole = true) {
  translate([0,0,2*(n-1)*w - space]) rotate([0,180,0]) leaf(d, w, n - 1, elevated, hole);
}

module pin(d, w, n) {
  cylinder(d = d - 2 * space, h = 2*n*w - w - space, $fn = 100, center = false);
}

// Print disassembled
// right = true => Print right leaf
// left = true => Print left leaf
// elevated = true => Print elevated knuckles
module hinge(d, w, n, elevated = false, right = true, left = false) {
  if (elevated){ 
      translate([0,-(d+2*border)/2 - 2*border,0]) {  
          if (right) leaf(d, w, n, elevated);
          if (left) left_leaf(d, w, n, elevated);
      }
  } else {    
      translate([0,-(d+2*border)/2,0]) {  
          if (right) leaf(d, w, n, elevated);
          if (left) left_leaf(d, w, n, elevated);
      }
  }  
}

// Print "in place" with pin
// open = true => The hinge can be disassembled
module assembledHinge(d, w, n, right = true, left = false, open = false) {
  translate([0,-(d+2*border)/2 - 2*border,0]) {  
    if (right) { 
      leaf(d, w, n, elevated = true, hole = false);
      pin(d, w, n);
    }
    if (left) {
      difference() {
        left_leaf(d, w, n, elevated = true);
        if (open) translate([-(d + 3*border),-d/2,0]) cube([d + 3*border, d,  2*n*w - w - space]);
      }      
    }
  }   
}

module hingeExample() {
  assembledHinge(5, 5, 3, right = true, left = true);
  difference() {
      translate([-20,0,0]) cube([40,10,25]);
      translate([-18,2,2]) cube([36,6,21]);
      translate([-0.1,-1,-1])cube([0.2,30,50]);
  }
}

hingeExample();