function [ abbr ] = abbreviatingCamelCase( sentence )
%
% Function Name: abbreviatingCamelCase
%
% Inputs  (1): - (char) A sentence to be Abbreviating Camel Cased
%                
% Outputs (1): - (char) The abbreviated and camel cased sentence
%
% Function Description:
%   Write a function that both abbreviates a sentence and converts it to
%   camel case. You will abbreviate the sentence by removing all of the
%   vowels from the sentence, unless the vowel is the first letter of a
%   word, and then converting to camel case.
%
%   In case you are unfamiliar, you have already seen camel case in your
%   matlab homeworks. Camel case simply means removing all spaces from a
%   phrase, and instead using capitol letters to indicate where words
%   change. You also lowercase the first letter in the entire sentence. For
%   example: "Hello world lets party" would become "helloWorldLetsParty"
%   when converted to camel case.
%
% Example:
%
%       input: 'Speeding tickets are lame'
%
%       output: 'spdngTcktsArLm'
%
% Hints:
%   - The space characters in your string can be useful.
%   - You may assume there will not be any punctuation marks.
%
%
% Test Cases:
%
%       abbreved1 = abbreviatingCamelCase('woot I love matlab')
%           abbreved1 => 'wtILvMtlb'
%
%       abbreved2 = abbreviatingCamelCase('one fish two fish red fish blue fish')
%           abbreved2 => 'onFshTwFshRdFshBlFsh'
%
% Note: IF THE FORMAT OF YOUR OUTPUT STRING IS NOT EXACTLY RIGHT THEN
%       YOU WILL RECEIVE ZERO CREDIT FOR THIS PROBLEM. So make sure you
%       have no typos, that you include all the correct punctuation, and
%       that you don't have an extra space character on the end that you
%       can't see.
%

idx = regexpi(sentence,'[aeiouAEIOU]');
ida = find(sentence == ' ');
if upper(sentence(1))==true
    sentence(1)= lower(sentence(1));
end

if upper(sentence(ida+1))==true
    sentence(ida+1)= lower(sentence(ida+1));
else
    sentence(ida+1) = upper(sentence(ida+1));
end

if sentence(1) == sentence(idx(1))
    idx(1) = [];
end
tracker = 1;
while tracker <= length(idx)
    if(sentence(idx(tracker)-1) == ' ')
        idx(tracker) = [];
        tracker = tracker +1;
    else
        tracker = tracker +1;
    end
end


sentence(ida ==' ');
sentence(idx) = [];
idc = sentence == ' ';
sentence(idc) = [];
abbr =sentence;

end

