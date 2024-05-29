include <caja.scad>

cajaX = 100;
cajaY = 50;
cajaZ = 10;
pared = 2;

placaX = 62.5;
placaY = 27.5;
placaZ = 1.8;

camaZ = cajaZ - pared;
camaBorde = 2;
camaSoporte = 4;

radioBoton = 14 / 2;

module cama(){
  difference(){
    cube([placaX + (2*camaBorde), placaY + (2*camaBorde), camaZ]);     
    translate([camaBorde + camaSoporte, camaBorde + camaSoporte, -0.001]){
      cube([placaX - (2*camaSoporte), placaY  - (2*camaSoporte), camaZ + 1]); 
    }
    translate([camaBorde + camaSoporte, -0.001, -0.001]){
      cube([placaX - (2*camaSoporte), placaY + (2*camaBorde) + 1, camaZ + 1]); 
    }
    translate([-0.001, camaBorde + camaSoporte, -0.001]){
      cube([placaX + (2*camaBorde) + 1, placaY - (2*camaSoporte), camaZ + 1]); 
    }
  }
}

module camaConRebaje(){
  difference(){
    cama();
    translate([camaBorde, camaBorde, camaZ + 0.001 - placaZ]){
      cube([placaX, placaY, placaZ + 1]); 
    }
  }
}

module cajaInferior(){
  difference(){
    cajaMacho(cajaX, cajaY, cajaZ, pared, pared, n = 5, fn = 32);
    translate([0 - 0.001, ((cajaY - 16) / 2), cajaZ - 4 + 0.001]) cube([pared + 1, 16, 4]);
  }
  translate([0, (cajaY - (placaY + (2*camaBorde))) / 2, pared - 0.001]) camaConRebaje();
}


module cajaSuperior(){
  displayX = 23;
  displayY = 15;
  displayZ = cajaZ - 3;
  difference(){
    union(){
      cajaHembra(cajaX, cajaY, cajaZ, pared, pared + 0.1, n = 5, fn = 32);      
      // Display
      translate([12, ((cajaY - (displayY + 2) ) / 2) + 1, 0]) cube([displayX + 2, displayY + 2, displayZ]);      
    }    
    // Corte para el display
    translate([13, ((cajaY - displayY) / 2) + 1, -0.001]) cube([displayX, displayY, displayZ + 0.002]); 
    // Corte para el USB
    translate([-0.001, ((cajaY - 16) / 2), cajaZ - 6 + 0.001]) cube([pared + 1, 16, 6]);  
    espacioBotones = 20;
    translate([placaX + 15 + radioBoton ,(cajaY - espacioBotones) / 2,-0.001]) cylinder(r = radioBoton, h = cajaZ, $fn = 32);    
    translate([placaX + 15 + radioBoton ,((cajaY - espacioBotones) / 2) + espacioBotones,-0.001]) cylinder(r = radioBoton, h = cajaZ, $fn = 32);
  }
  translate([0, (cajaY - (placaY + (2*camaBorde))) / 2, pared - 0.001]) cama();
}

//cajaSuperior();
cajaInferior();

