function [ vortexout ] = vectorVortex( rows, columns, numbers )
% Function Name: vectorVortex
%
% Inputs  (3): - (double) The number, n, of rows of the array
%              - (double) The number, m, of columns of the array
%              - (double) A vector of numbers
%
% Outputs (1): - (double) The vortex array
%
% Function Description:
%   Write a function called vectorVortex that creates a "vortex" of an
%   input vector. Starting with the top left corner of a n x m array, the
%   vector should create a clockwise border around the array. Then, create
%   an inner clockwise border such that a layer of zeros exists between the
%   outside and inside border. The example below illustrates this. Notice
%   that 
%
%   For example:
%      Given a vector, [1 2 3 4 5 6 7 8 9 10 11 12 ... 30 31 32], and the
%      dimensions 7 x 7:
%
%           out = vectorVortex(7,7,1:32)
%              out => [ 1     2     3     4     5     6     7
%                      24     0     0     0     0     0     8
%                      23     0    25    26    27     0     9
%                      22     0    32     0    28     0    10
%                      21     0    31    30    29     0    11
%                      20     0     0     0     0     0    12
%                      19    18    17    16    15    14    13]
%
% Notes: 
%   - The zeros function may be helpful.
%   - The vector you need will always be the necessary length.
%   - The dimensions of the array will always be large enough to fit the
%     vortex (the inner and outer borders).
%
% Test Cases:
%
%       out1 = vectorVortex(7,9,2:2:80)
%           out1 =>    [ 2     4     6     8    10    12    14    16    18
%                       56     0     0     0     0     0     0     0    20
%                       54     0    58    60    62    64    66     0    22
%                       52     0    80     0     0     0    68     0    24
%                       50     0    78    76    74    72    70     0    26
%                       48     0     0     0     0     0     0     0    28
%                       46    44    42    40    38    36    34    32    30]
%
%       out2 = vectorVortex(6,6,1:24)
%           out2 => [ 1     2     3     4     5     6
%                    20     0     0     0     0     7
%                    19     0    21    22     0     8
%                    18     0    24    23     0     9
%                    17     0     0     0     0    10
%                    16    15    14    13    12    11)
%
%

temp1= numbers;
vortexout=zeros(rows,columns);
vortexout(1,:) = temp1(1:columns); %top row
temp1(1:columns-1) = [];
vortexout(:,end) = temp1(1:rows);
temp1(1:rows-1) = [];
vortexout(end,end:-1:1) = temp1(1:columns); %bottom row
temp1(1:columns-2) = [];
vortexout(2:rows,1:-1:1) = temp1(1,rows:-1:2);

temp1(1:rows) = [];
if(size(temp1>0));
vortexout(3,3:end-2) = temp1(1:columns-4); %top row 2
temp1(1:columns-4) = [];
end

if((length(temp1)>2));
vortexout(4,end-2,1:-1:end)=temp1(1,rows-6:-1:1);
temp1(1:rows-6) = [];
 %   end
%else
 %   vortexout(4,end-2,1:-1:end)= temp1(1,rows-6:-1:1)
end
if(size(temp1>1));
vortexout(end-2,end-2:-1:3) =temp1(1:columns-4); %bottom row 2
end
if(length(temp1)>2);
temp1(1:columns-4) = [];


vortexout(4,1+2,1:-1:end)= temp1(1,rows-6:-1:1);
end

end

