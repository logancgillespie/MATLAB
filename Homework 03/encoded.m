function [ outputvector ] = encoded( vec1, num1 )
% Function Name: encoded
%
% Inputs  (2): - (double) A 1xN vector
%              - (double) A number that might be encoded into the vector
%
% Outputs (1): - (logical) A 1x4 vector of true/false values, showing
%                          whether or not the number is encoded into the
%                          vector in the 4 described ways.
%
% Function Description:
%   Write a function that takes in two inputs: a vector of any length, and
%   a number. Your function needs to check if the number is "encoded" into
%   the vector in any of 4 possible ways. These are as follows:
%
%       1) The number is actually contained in the vector.
%               ex1: [7 9 4] is the vector, and 4 is the number.
%               ex2: [5 9 7 3 2] is the vector, and 9 is the number.
%
%       2) The number is the distance between all adjacent values in the vector.
%               ex1: [3 6 9 12] is the vector, and 3 is the number.
%               ex2: [0 5 10 15] is the vector, and 5 in the number.
%               ex3: [4 5 6 7] is the vector, and 1 is the number.
%              
%       3) The number is the same as the sum of all the values in the
%          vector.
%               ex1: [1 2 3 4] is the vector, and 10 is the number.
%               ex2: [0 0 1 1 2 2] is the vector, and 6 is the number.
%
%       4) Every value in the vector is divisible by the number.
%               ex1: [3 6 21 99999] is the vector, and 3 is the number.
%               ex2: [16 20 8] is the vector, and 4 is the number.
%
%   Your function should output a 1x4 logical vector of the true/false
%   values for the above encodings that you need to check, with each index
%   of your output corresponding to the numbers above.
%
%   Your function is simply checking an inputted vector and inputted number
%   to see if the "encoding" exists already. And the possible ways for
%   encoding to exist are the 4 ways described above. For example: If your
%   inputted number is actually contained in your inputted vector, then the
%   first index of your logical output vector will be a True (because this
%   is the 1st check on the list above). If the inputted number is not the
%   distance between all adjacent values in the inputted vector, then the
%   2nd index of your logical output vector will be False (because this is
%   the 2nd check on the list above). Etc.
%
% Notes:
%   - Treat 0 as being divisible by everything.
%
% Hints:
%   - mod() also works with vectors
%   - all() could be quite useful
%   - This is a Logicals problem, not a Vectors problem.
%
% Test Cases:
%
%       [out1] = encoded([-1 0 1 2], 1)
%           => out1 = [1 1 0 1]
%              %must be Logical class
%   
%       [out2] = encoded([14 21 28 35], 7)
%           => out2 = [0 1 0 1]
%              %must be Logical class
%
%       [out3] = encoded([1.1 1.2 1.3 1.4], 5)
%           => out3 = [0 0 1 0]
%              %must be Logical class
%
% establishing a default logical vector
outputvector= [false,false,false,false];
% establishing a tracker variable to define the position in the loop
tracker = 1;
% defining the indicies where the loop should go
while tracker <= length(vec1)
    % if the vector contains the specified "num1" it returns true and 
    %increments the tracker
    if vec1(tracker) == num1
        outputvector(1) = true;
        tracker = tracker +1;
    end
    % If no number is found the tracker just increases and loops again
    % unless it is at the end of the vector
    tracker = tracker +1;
end
% checking to see if each value in the vectors difference is equal to num1
tracker2= 1;
while( tracker2<= length(vec1)-1)
if abs(vec1(tracker2) - vec1(tracker2+1)) == num1
    outputvector(2) =true;
    tracker2= tracker2+1;
else
    tracker2 = tracker2 +1;
end
% if the sum of a vector is equal to num1 the value is changed to true
if sum(vec1) == num1
    outputvector(3) =true;
end

% establishing a new tracker
tracker1 = 1;
% defining the indicies where the loop should go
while(tracker1 <= length(vec1))
    %if the numbers in the provided vector are not the same distance apart then
    %then output vector value is set to false
    if(mod(vec1(tracker1),num1)~=0)
        outputvector(4) =false;
        tracker1 = tracker1 +1;
    
    else
        %otherwise the value of the vector is =1 which means they are the
        %same value apart
        outputvector(4) = true;
        tracker1 = tracker1 + 1;
    end
end
    
end


    

