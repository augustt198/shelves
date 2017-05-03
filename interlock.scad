$fn = 25;

fin_len = 5;
fin_width = 1.5;

slit_len = 2.5;
slit_width = 0.5;

module fins_base(n_fins) {
    union() {
        for (deg = [0 : 120 : (n_fins-1)*120])
            rotate([0, 0, deg])
            difference() {

                translate([-fin_width/2, 0]) square([fin_width, fin_len]);
                
                polygon(points=[[slit_width/2, fin_len], [fin_width/2, fin_len], [fin_width/2, fin_len-(fin_width-slit_width)/2]]);
                polygon(points=[[-slit_width/2, fin_len], [-fin_width/2, fin_len], [-fin_width/2, fin_len-(fin_width-slit_width)/2]]);
            }
    };
}

module fins_slits() {
    union() {
        for (deg = [0 : 120 : 240])
            rotate([0, 0, deg])
            translate([-slit_width/2, fin_len-slit_len]) square([slit_width, slit_len]);
    };
}

module interlock(n_fins) {
    circle(fin_width/2);
    difference() {
        fins_base(n_fins);
        fins_slits();
    };
}

interlock(3);