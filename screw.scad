include <BOSL2/std.scad>
include <BOSL2/screws.scad>
$fn=200;

spec = screw_info("1/4-20,1/2", thread = "UNC", head = "socket", length = 10);
newspec = struct_set(spec,["head_size",30,"head_height",10]);
screw(newspec);