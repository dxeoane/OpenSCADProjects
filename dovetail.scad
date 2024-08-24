module dovetail(w1, w2, l, h) {
    linear_extrude(h) polygon(points = [[0, 0],[w1, 0],[(w1+w2)/2, l],[(w1-w2)/2, l]],  paths = [[0,1,2,3]]);
}

module dovetail2(w1, w2, l, h) {
    linear_extrude(h) polygon(points = [[(w1-w2)/2, 0],[(w1+w2)/2, 0],[w1, l],[0, l]],  paths = [[0,1,2,3]]);
}


// dovetail(100,50,20,20);