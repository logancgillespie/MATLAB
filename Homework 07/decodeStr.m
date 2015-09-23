function [ decoded ] = decodeStr( coded, pull )
% Function Name: decodeStr
%
% Inputs (2):  - (string) A coded message
%              - (double) A number indicating which word/character to pull
%                         from the string (ex: 4 -> keep every fourth
%                         word/charater)
%
% Outputs (1): - (string) The decoded message
%
%
%
% Function Description:
%   As an aspiring secret agent, your first training mission (should you
%   choose to accept it) is learning to recognize and decode secret
%   messages. You will start off simple, by writing a matlab function to
%   decode only two differing types of secret message. The first kind of
%   secret message is a sentence, with words in it separated by spaces,
%   where the secret message is simply every Nth word in the sentence, and
%   where N is your "code factor". For example: if a certain sentence has a
%   code factor of 4, the secret message is every 4th word in the sentence.
%   The second kind of secret message you will decode is a string of
%   characters, without any spaces. For this case, the secret message
%   contained is every Nth character. Your matlab function should be able
%   to recognize and decode both types of secret message. These
%   instructions will self-destruct in 15 seconds.
%
%   To summarize: if your input string has spaces in it, you should pull
%   out every Nth word (where N is the 2nd input) and concatenate then into
%   your output, and if your input string does not have spaces in it, you
%   should pull out every Nth character and concatenate those into your
%   output.
%
%
% Notes:
%   - Whether or not your input has spaces in it will determine if you pull
%     out every Nth word or every Nth character.
%   - Do not worry about changing punctuation or capitalization.
%   - There can be more than one space between words (but only spaces).
%   - Your decoded message should NOT end with a space.
%
% Test Cases:
%
%       str = ['I want to go  to the   track meet and eat a Jimmy Johns ' ...
%              'gourmet sandwich  on the first  with    Wednesday Adams.'];
%       [out1] = decodeStr(str,4)
%           => out1 = 'go meet Jimmy on Wednesday'
%
%       [out2] = decodeStr('www.harttoregerill.com/op',3)
%           => out2 = 'waterloo'
%

%taking the origional string and removing extra spaces in sequence
index1=1;
while index1< length(coded)
    %if there is one space after another then remove the second space
    if(coded(index1)==' ' & coded(index1+1)==' ' )
        coded(index1+1) ='';
    else
        %otherwise index the index value by 1
        index1=index1+1;
    end
end

%If there are spaces in the string then index the locations of these spaces
if(find(coded==' '))
    found=find(coded==' ')
    index =1;
    pulled = pull;
    %starting the decoded string with the value following the first
    %specified space
    decoded = coded(found(pull-1)+1:found(pull))
    %incrementing pulled by the value specified at the start of the
    %function
    pulled = pulled + pull;
    
    %while the value of the pulled function is less than or equal to the
    %length of the found string the function will count by "pull" and add
    %the value from the specified space to the next space in the string
    while pulled <= length(found)

        decoded = [decoded, coded(found(pulled-1)+1:found(pulled))]
        pulled = pulled + pull
    
        
    end
    %removing space from end
    decoded(end) = '';
    
    %if there are no spaces in the string then the function must count based
    %on characters
else
    %while the value of the pulled function is less than or equal to the
    %length of the found string the function will count by "pull" and add
    %the value at the specified character in the string
    pulled1=pull;
    decoded = '';
    while pulled1 <= length(coded)
        decoded = strcat(decoded, coded(pulled1));
        pulled1 = pulled1 + pull;
    end
    
end

end

