$fn = 100;

width = 73.5;
depth = 49.99;
height = 59;

radius = 2;     // radius of the edges and corners
thick = 3;      // thickness of the front and side walls
thicker = 4;    // a bit thicker because rendering is sad
rim = 7.5;      // the length of the front walls

union() {
  // remove the front rims that we want to correct
  difference() {
    holder();
    translate([thick, depth-thicker, 0]) cube([width-2*thick, thicker, height-rim]);
  }
  
  // re-apply the front rims
  translate([width-thick-rim, depth-thick, 0]) lrim();
  translate([thick, depth-thick, 0]) rrim();
}

// produces the right front rim by intersecting 
// the original model and a cube of desired size
module rrim() {
  intersection() {
    cube([rim, thick, height-radius]);
    translate([-width+rim, -depth+thick, 0]) holder();
  }
}

// produces the left front rim by intersecting 
// the original model and a cube of desired size
module lrim() {
  intersection() {
    cube([rim, thick, height-radius]);
    translate([0, -depth+thick, 0]) holder();
  }
}

// produces the original model with PoO at 0,0,0
module holder() {
  translate([width/2, depth/2, height/2])
    import("Belkin Power Strip 2 Template.stl", center = true);
}