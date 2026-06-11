union() {
  difference() {
    cable_loop();
    translate([0, 22, 0]) cube([85, 44, 35], center = true);
  }
  rotate([0, 0, 90]) difference() {
    cable_loop();
    translate([-21, 0, 0]) cube([42, 85, 35], center = true);
  }
}

module cable_loop() {
  import("./Cable Loop Straight 3x3.stl", center = true);
}
