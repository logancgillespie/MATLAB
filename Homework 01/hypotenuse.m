function [trihypo] = hypotenuse(sideA, sideB) 
%
% Inputs (2):  - (double) A side of a triangle
%              - (double) A side of a triangle
%
% Outputs (1): - (double) The hypotenuse of a triangle
%
% Function Description:
%   Write a function named, pythagorean, that takes in two sides of a
%   triangle and ouputs hypotenuse.  Remember, the pythagorean theorem is:
%
%          (sideA.^2) +(sideB.^2) = (hypotenuseC.^2)
%
%   A visual of the triangle is given below:
%
%            |\
%            | \
%   sideA    |  \   hypotenuseC
%            |   \
%            |    \
%            |_____\
%      
%             sideB
% Calculating the hypotenuse
trihypo= sqrt((sideA.^2) + (sideB.^2));
end