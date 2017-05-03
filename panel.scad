slit_width = 0.5;
slit_len = 2;

panel_width = 12;
panel_len = 20;

tab_width = 10;
tab_len = 1;

back_slit_height = 18;

module panel() {
    polygon(points=[
        [panel_width/2, 0], [panel_width/2, panel_len],
        [-panel_width/2, panel_len], [-panel_width/2, 0],
        [-tab_width/2, -tab_len], [tab_width/2, -tab_len]
    ]);
}

module slits_front() {
    union() {
        translate([panel_width/2 - slit_len, 0])
            square([slit_len, slit_width]);

        translate([-panel_width/2, 0])
            square([slit_len, slit_width]);
    }
}

module slits_back() {
    union() {
        translate([panel_width/2 - slit_len, back_slit_height])
            square([slit_len, slit_width]);

        translate([-panel_width/2, back_slit_height])
            square([slit_len, slit_width]);
    }
}

difference() {
    panel();
    slits_front();
    slits_back();
};