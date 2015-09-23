function [ encoded ] = caesarWrapCase( string, shift )
% Function Name: caesarWrapCase
%
% Inputs  (2): - (char) Some string that needs to be encoded.
%              - (double) An integer of how far to shift.
%
% Outputs (1): - (char) The inputted string encoded with a caesar shift.
%
% Caeser Cipher Information:
% 	The Caesar cipher is named after Julius Caesar, who, according to 
% 	Suetonius, used it with a shift of three to protect messages of 
% 	military significance. It is unknown how effective the Caesar cipher
% 	was at the time, but it is likely to have been reasonably secure
%   because most of Caesar's enemies would have been illiterate and
% 	others would have assumed that the messages were written in an unknown 
%   foreign language.
% 
%   Caesar ciphers can still be found today in children's toys such as
%   secret decoder rings. A Caesar shift of thirteen is also performed in
%   the ROT13 algorithm, a simple method often used to obscure text such as
%   joke punchlines and spoilers online.
%
%	In the Caesar cipher, each letter is shifted by the specified amount.
%	For example, if the shift is 3, then the letter 'a' would be coded as
%	the letter 'd'. 
%
% Function Description:
%	Write a function that inputs a string and how far it needs to be
%	shifted, and performs the caesar shift. Only letters should be shifted
%	(as in, punctuation and space characters should not be changed). When a
%	letter goes beyond the alphabet from the shift performed, you will need
%	to make it wrap back around. What this means is that if the letter 'y'
%	is shifted by 4, it will need to wrap back around to 'C'. However,
%	letters for this variation of the caesar problem will need to change
%	case when they wrap back around. As in, lowercase letters will become
%	uppercase if they go past 'z', and uppercase letters will become
%	lowercase if they go past 'Z'. A letter is allowed to change case more
%	than once if it experiences a shift more than 26.
%
%   Example: Original Letter | Shift | New Letter
%            ------------------------------------
%            'x'             | 9     | 'G'
%            'a'             | -4    | 'W'
%            'Z'             | 3     | 'c'
%            'a'             | 26    | 'A'
%
% Notes:
%   - The Caesar cipher should work for both positive and negative integers
%     that indicate the shift given by the second input.
%   - Shifts may be positive or negative, and may have any value.
% 
% Hints:
%   - The mod() function may be useful.
%
% Test Cases:
%
%       coded1 = caesarWrapCase('Thank you Mario!', 4)
%           coded1 => 'Xlero Csy Qevms!'
%
%       coded2 = caesarWrapCase('Iba vby Wypujlzz pz pu huvaoly jhzasl!', 19)
%           coded2 => 'but OuR pRINCESS IS IN ANOtHER CAStLE!'
%
%       coded3 = caesarWrapCase('Uh, why isn''t this cipher working?', 52)
%           coded3 => 'Uh, why isn't this cipher working?'
%
% Note: IF THE FORMAT OF YOUR OUTPUT STRING IS NOT EXACTLY RIGHT THEN
%       YOU WILL RECEIVE ZERO CREDIT FOR THIS PROBLEM. So make sure you
%       have no typos, that you include all the correct punctuation, and
%       that you don't have an extra space character on the end that you
%       can't see.
%
string1=string;

%mask1= string1 == '!'
%mask2=  string1 == '.' 
%mask3= string1 == '?' 
%mask4 = string1 == ','
%mask5 = string1 == '"'
%mask6 = string1 == ' '

%string1(mask1) = [];
%string1(mask2) = [];
%string1(mask3) = [];
%string1(mask4) = [];
%string1(mask5) = [];
%string1(mask6) = [];
tracker1=1;
while(tracker1<length(string1))
if((string1(tracker1) ~= ' '& string1(tracker1) ~= '!'& string1(tracker1) ~= ','& string1(tracker1) ~= '"'))
string1(tracker1) = string1(tracker1) + shift;
tracker1= tracker1+1;
else
    tracker1=tracker1+1;
end
end

tracker=1;
tracker1=1;
string1=double(string1);
while(tracker<length(string1))
if(string1(tracker)> 122 & (string1(tracker1) ~= ' '& string1(tracker1) ~= '!'& string1(tracker1) ~= ','& string1(tracker1) ~= '"'))
    string1(tracker) =string1(tracker)-58;
    tracker = tracker +1;
else
      tracker = tracker +1;
end
end

while tracker1< length(string1)
if(string1(tracker1) > 90 && string1(tracker1)<97 & (string1(tracker1) ~= ' '& string1(tracker1) ~= '!'& string1(tracker1) ~= ','& string1(tracker1) ~= '"'))
    string1(tracker1) = string1(tracker1)+6;
    tracker1 = tracker1+1;
else
    tracker1=tracker1+1;
    
end
end

tracker2 = 1;
while tracker2 < length(string1)
    if(string1(tracker2) < 65 && (string1(tracker1) ~= ' '& string1(tracker1) ~= '!'& string1(tracker1) ~= ','& string1(tracker1) ~= '"'))
        string1(tracker2) = string1(tracker2) + 53;
        tracker2 = tracker2+1;
    else
        tracker2=tracker2+1;
    end
end
char(string1)
%if (string1(tracker) > 90 && string1(tracker) < 97) && (string1(tracker ~= ' ')||string1(tracker ~= '!')||string1(tracker ~= ','))
%    string1(tracker)+6
%      tracker = tracker +1;
%else
%      tracker = tracker +1;
%end
%if string1(tracker) > 122  && (string1(tracker ~= ' ')||string1(tracker ~= '!')||string1(tracker ~= ','))
%    string1(tracker)+59
%      tracker = tracker +1;
%else
%      tracker = tracker +1;
%end
%string1 = char(string1)
encoded = char(string1);

end

