radius=2.54*3/2*10;
thickness=1.2;

translate([0,0,0]){
    globe();
}

module globe(){
    // cut out sphere
    difference(){
        ball();
        times=8;
        for (i=[0:times]) {
            rotate([0, 0, 360 / times * i]) {
                translate([radius, 0, 0]) {
                    scale([1, 1, 20])
                        sphere(r = 11);   
                }
            }
        }
    }
    translate([0, 0, radius]) {
        loopdedoop();   
    }
}

module loopdedoop(){
    loopRadius=10;
    // base
    cylinder(r=radius / 3.5, radius / 5, center=true);

    // hook
    rotate([0, 90, 0]) {
        scale([1.5, 1, 1]) {
            linear_extrude(height = thickness*4, center = true, convexity = 10, slices = 20, scale = 1.0, $fn = 16) {
                difference(){
                    circle(r=loopRadius);
                    circle(r=loopRadius-thickness*2);
                    translate([loopRadius, 0, 0]) {
                        square(size=[loopRadius*2, loopRadius*3], center=true);
                    }
                }
            }
        }
    }
}

module ball()
{
    difference(){
        sphere(r=radius);
        sphere(r=radius-thickness*2);
    }
    difference(){
        sphere(r=radius);
        translate([0,0,radius*3/3.5]) {
            cube([radius*3,radius*3,radius*3], center=true);
        }
    }
}

