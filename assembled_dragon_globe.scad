import("globe_bigger_windows.stl");

scale=.5;
rotate([0, 0, -1]) {
    translate([0, 0, -5]) {
        scale([1*scale, 1*scale, 1*scale]){ 
                translate([0, -25, -40]){
                import("Dragon.stl");
                }
            }   
    }
}    