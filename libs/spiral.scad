module turn(diameter, height, width, segments) {
    angleStep = 360 / segments;
    r = diameter / 2;
    for (s = [0:segments]) {
        i = s;
        next_i = (s + 1) % segments;
        angle = i * angleStep;
        next_angle = next_i * angleStep;
        hull() {
            translate([ r * cos(angle), r * sin(angle), (i / segments) * height]) sphere(d=width, $fn=16);
            translate([ r * cos(next_angle), r * sin(next_angle), (s + 1) / segments * height]) sphere(d=width, $fn=16);
        }
    }   
}

module spiral(diameter, height, width, turns, segments) {
    turnHeight = height / turns;
    for (t = [0:turns-1]) {
        translate([0, 0, t * turnHeight]) 
            turn(diameter, turnHeight, width, segments);
    }
}



// Example usage
// spiral(diameter=20, width=2, height=10, turns=2, segments=200);