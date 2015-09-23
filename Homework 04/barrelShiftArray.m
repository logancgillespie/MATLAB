function [ shiftedarray ] = barrelShiftArray( array, numberoftimes )
%==========================================================================
% PROBLEM 5.  EXTRA CREDIT - EXTRA CREDIT - EXTRA CREDIT - EXTRA CREDIT
%--------------------------------------------------------------------------
%
% Function Name: barrelShiftArray
%
% Inputs  (2): - (double) An array
%              - (double) A number of times to shift the array
%
% Outputs (1): - (double) The shifted array
%
% Function Description:
%
%
%   Write a function called "barrelShift" that takes in an array and a
%   number of times to shift the array, and outputs the hifted array. Each
%   time the array is shifted, it snakes around by going down the columns.
%   If a number is on the last row of the column, it then shifts to the
%   first row of the next column. If it is the last row of the last column,
%   it then shifts to the first row of the first column. For example, if
%   you have an array that looks like this:
%
%                 arr =  [10 11 12 13
% 						  14 15 16 17
% 						  18 19 20 21]
%
%   it will look like this after you perform a barrel shift:
%
%                           1 time:  [21 18 19 20
%									  10 11 12 13 
%                                     14 15 16 17]
%
%                           2 times: [17 14 15 16
%									  21 18 19 20 
%                                     10 11 12 13]
%
%                           3 times: [13 10 11 12
%									  17 14 15 16 
%                                     21 18 19 20]
%
%                           4 times: [20 21 18 19
%									  13 10 11 12 
%                                     17 14 15 16]
% 
%   Basically, every time you do one barrel shift the array is shifted down
%   the rows and across the columns to the right. The number at the end is
%   moved to the front position. This process is repeated for the number of
%   shifts specified. If the number of shifts is negative, then the vector
%   should be barrel shifted to the left instead of the right.
%
% Notes:
%   - If the number of shifts is zero, then the function should return the
%     original array.
%   - You may *not* use the function 'circshift'
%
% Hints:
%   - Remember if you try to index out of an array's boundary or index 
%     with a negative number, it will produce an error.
%   - You may find the mod(), reshape(), and size() functions useful. And
%     think of it as one big shift instead of multiple single shifts.
%
% Test Cases:
% 	A = [4 5 6 7 8];
%   B = [1 5; 2 6; 3 7; 4 8];
%   C = [2 10 5 7; 1 12 8 6; 3 4 9 11];
%
%   shifted1 = barrelShiftArray(A, 2);
%       shifted1 => [7 8 4 5 6]
%
%   shifted2 = barrelShiftArray(B, 5);
%       shifted2 => [4  8
%                    5  1
%                    6  2
%                    7  3]
%
%   shifted3 = barrelShiftArray(C, 33);
%       shifted3 => [10  5  7  2
%                    12  8  6  1
%                     4  9 11  3]
%
%   shifted4 = barrelShiftArray(C, -3);
%       shifted4 => [10  5  7  2
%                    12  8  6  1
%                     4  9 11  3]

array1 = array;
array1=array1(:);
a=mod(numberoftimes,length(array1));
b=array1(end-a+1:end);
array2= [b; array1(1:end-a)];
shiftedarray=reshape(array2,size(array));

end

