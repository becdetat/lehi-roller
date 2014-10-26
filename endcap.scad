// A square endcap.
// Created for the Lehi Roller CNC Mill project
// https://github.com/bendetat/lehi-roller


endcap(20, 1, 0);

module endcap(intSize, wallThickness, holeDiameter) {
	holeRadius = holeDiameter / 2;
	extSize = intSize + wallThickness * 2;
	holeTranslation = extSize / 2 - holeRadius / 2;
	
	difference() {
		cube([extSize, extSize, extSize]);
		
		translate([wallThickness, wallThickness, wallThickness * 3]) {
			cube([intSize, intSize, intSize]);
		}

		// punch holes #1
		translate([holeTranslation, extSize + 5, holeTranslation + wallThickness]) {
			rotate([90,0,0]) {			
				cylinder(h=extSize+10, r=holeRadius);
			}
		}

		// punch holes #2
		translate([-holeTranslation/2 , holeTranslation, holeTranslation + wallThickness]) {
			rotate([0,90,0]) {			
				cylinder(h=extSize+10, r=holeRadius);
			}
		}
	}

}


