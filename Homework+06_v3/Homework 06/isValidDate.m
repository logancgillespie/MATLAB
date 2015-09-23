function [ validity ] = isValidDate( date )
% Function Name: isValidDate
%
% Inputs (1):  - (char) a string representing a date
%
% Outputs (1): - (logical) a logical representing the validity of the date
%
% Function Description:
%   Write a function called "isValidDate" that determines whether or not a
%   date is valid. The input date will always be in the format '<month>
%   <day>, <year>' (for example, 'January 1, 2014').
%
%   Here are the rules that your function must use to check date validity:
%     1) The year must be a positive integer
%     2) The month must be spelled correctly and have the first letter
%        capitalized.
%     3) The day must be an integer in the allowable range for that month
%       (As in: 'February 31, 2014' would not be valid.)
%
%   If any of these three rules are violated, your function should output
%   false.
%
%
%   Here is a rhyme help you to remember how many days are in each month:
%     "Thirty days have September, April, June, and November. All the rest
%      have thirty-one, except for February, which is dumb."
%   February has 28 days in a non-leap year and 29 days in a leap year.
%
%   Your function should also account for leap years. Here are two easy
%   rules to determine if a year is a leap year:
%     1) If the year is divisible by 400, it is a leap year
%     2) If the year is not divisible by 400, it must be divisible by 4 but
%        not by 100 to be a leap year
%
% Notes:
%   - The day and year are NOT guaranteed to be positive or integer-valued.
%   - There will never be a suffix on the day of the month.
%
% Hints:
%   - You may find the strtok() function useful.
%   - Especially with this function, the test cases below are helpful but
%     not a guarantee that you will get the question correct. If you want to
%     be thorough you should check your code with many of your own test
%     cases.
%
% Test Cases:
%
%       valid1 = isValidDate('September 30, 2014')
%           => valid1 = true
%
%       valid2 = isValidDate('September 31, 2014')
%           => valid2 = false
%
%       valid3 = isValidDate('February 29, 2012')
%           => valid3 = true
%
%       valid4 = isValidDate('December 29.9, -1005.7')
%           => valid4 = false
%
%

%Extracting info from input string
[month rest] = strtok(date,' ,');
[day rest1] = strtok(rest, ' ,');
[year rest2]=strtok(rest1, ' ,');

%converting string values to number values
day = str2num(day);
year = str2num(year);

%checking if the year is valid (greater than zero)
if year < 0
    validity = false;
else
    %if it is check and see if it matches any of the following cases
    switch month
        case { 'April',  'June', 'September',  'November', }
            if day <=30 && day >0 && floor(day) == day
                validity = true;
            else
                validity = false;
            end
            
        case {'January', 'March','May','July', 'August','December', 'October'}
            if day <=31 && day >0 && floor(day)==day
                validity = true;
            else
                validity = false;
            end
            
        case  'February'
            if( mod(year, 400) == 0 && day <=29 && floor(day) == day)
                validity = true;
                %if the above guidelines don't match then check the
                %following
            elseif((mod(year, 4)==0) && floor(day) == day)
                if(mod(year,100) ~=0)
                    validity = true;
                else
                    validity = false;
                end
                
            else
                validity = false;
                
            end
            %default case is false
        otherwise
            validity = false;
    end
    
end
end

