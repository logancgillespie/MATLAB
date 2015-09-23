function [ posRoot , negRoot ] = quad( A, B, C )
% Inputs  (3): - (double) The first coefficient of a 2nd order polynomial,A
%              - (double) The corresponding 2nd coefficient, B
%              - (double) The corresponding 3rd coefficient, C
%
% Outputs (2): - (double) The positive root of the polynomial
%              - (double) The negative root of the polynomial
%
% Function Description:
%   Write a function called quad.m that takes in coefficients A, B, and C
%   from a 2nd order polynomial, and uses them to evaluate the quadratic
%   formula and find the two roots of the polynomial (where it is equal to
%   0). The "positive root" will come from using a plus sign for the +/-,
%   and the "negative root" will be from using a minus sign.
%
%   For reference, the quadratic formula is:
%
%                   -B  +/-  sqrt(B^2 - 4*A*C)
%                 ------------------------------
%                              2*A
%
% Notes: 
%   - Matlab follows order of operations, but don't be afraid to use lots
%     of parentheses anyway.
%   - sqrt() is a built-in function in matlab, and is the square-root
%     function. It takes the square root of a number.
%
% Test Cases:
%
%       [posRoot1,negRoot1] = quad(5,0,-5)
%           posRoot1 => 1
%           negRoot1 => -1
%   
%       [posRoot2,negRoot2] = quad(1,36,-9)
%           posRoot2 => 0.2483
%           negRoot2 => -36.2483

posRoot= (-B+sqrt(B^2-(4.*A.*C)))/(2.*A);
negRoot= (-B-sqrt(B^2-(4.*A.*C)))/(2.*A);

end

