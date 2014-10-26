// V sleeve for a 608 bearing
// Created for the Lehi Roller CNC Mill project
// https://github.com/bendetat/lehi-roller

$fn = 70;

scaleFactorX = 1.05;
scaleFactorY = scaleFactorX;
scaleFactorZ = 1.0;

bearingOd = 22;
bearingId = 8;
bearingDepth = 6.94;
sleeveMin = 1;
sleeveMax = 2.5;
sleeveBow = 3;

scale([scaleFactorX,scaleFactorY,scaleFactorZ]) {
	sleeve();
}

module sleeve() {
	difference() {
		union() {
			cylinder(r1=bearingOd/2+sleeveMin, r2=bearingOd/2+sleeveMax, h=bearingDepth/2 - sleeveBow/2);
			translate([0,0,bearingDepth/2-sleeveBow/2]) {
				cylinder(r=bearingOd/2+sleeveMax, h=sleeveBow);
			}
			translate([0,0,bearingDepth/2 + sleeveBow/2]) {
				cylinder(r1=bearingOd/2+sleeveMax, r2=bearingOd/2+sleeveMin, h=bearingDepth/2 - sleeveBow/2);
			}
		}
		translate([0,0,-1]) {
			cylinder(r=bearingOd/2,h=bearingDepth + 2);
		}
	}
}
