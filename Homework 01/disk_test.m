clear 
clc
big_r = 10;
th = 1;
[big_disk_vol, top, side] = disk(big_r, th)
big_hole_rad = 7;
big_hole_vol = disk(big_hole_rad, th);
N = 4;
bolt_hole_rad = .5;
bolt_hole_vol = disk(bolt_hole_rad, th);

overall_vol = big_disk_vol - big_hole_vol - N .* bolt_hole_vol

