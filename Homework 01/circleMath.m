function [area, perim] = circleMath(diam)
%
% Inputs (1):  - (double) The diameter of a circle
%
% Outputs (2): - (double) The area of the circle
%              - (double) The perimeter of the circle
%
% Function Description:
%   Write a function, circleMath, that takes in the diameter of a circle
%   and outputs the area and the perimeter.
%
% Calculating the radius from the diameter given
r = diam ./ 2;
% Calculating the area of the circle
area = pi .* (r .^ 2);
% Calculating the permiter of the circle
perim = pi .* diam;
end