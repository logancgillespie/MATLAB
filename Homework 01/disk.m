function [ volume, top_area, edge_area ] = disk( radius, thick )
%Description here
top_area =pi .* radius .^2;
volume = top_area .* thick;
edge_area = pi .* 2 .* radius .* thick;

end

