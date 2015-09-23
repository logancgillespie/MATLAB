function [ dominant, recessive, twowing ] = personalityTest...
    ( personality, orderedpersonality, subtype )
%Function Name: personalityTest
% Inputs (3): - (string) A string containing your personality type.
%             - (string) A string containing all possible personality
%                        types, in order from 1 to 10, separated by spaces.
%             - (string) A string containing the personality sub-type.
%
% Outputs (3): - (string) A string containing the dominant personality type
%                         and subtype
%              - (string) A string containing the recessive personality
%                         type
%              - (string) A string containing the two "wing" personality
%                         types
%
% Function Description:
%   The Enneagram personality test tells you your dominant personality
%   type, your two "wing" personality types, and your recessive personality
%   type. Your dominant personality type is the personality type that best
%   describes you. Your wing personality types are the two personality
%   types that you also have a few characteristics of. Your recessive
%   personality type is the personality type that you least resemble.
%
%   You took the Enneagram personality test, but it only gave you either
%   your dominant or recessive personality type. You wanted to know your
%   dominant, recessive, and wing personality types! Luckily, you can write
%   a MatLab function to figure out all of your personality types!
%
%   The Enneagram personality test is based on the following circle:
%
%                               1
%                          10        2
%
%                       9               3
%
%                       8               4
%
%                          7         5
%                               6
%
%   where each number is a personality number. Imagine you are standing at
%   one of the numbers, your dominant personality type, and looking into
%   the circle. The wing personalities are the two personality types
%   surrounding the dominant personality type. So, if your dominant
%   personality type was personality type 3, then your wing personality
%   types would be types 4 and 2. Your right wing personality is the number
%   to the right (counterclockwise on the circle) of your dominant
%   personality type (2 in this case) and your left wing personality type
%   is the number to the left (clockwise on the circle) of your dominant
%   personality type (4 in this case). Your recessive personality type is
%   the personality type opposite of your dominant personality type on the
%   circle. So, if your dominant personality type was 3, your recessive
%   personality type would be 8.
%
%   Write a MatLab function that takes an input of a dominant or recessive
%   personality type and outputs the other personality types. If the
%   inputed personality type starts with a lower case letter , then it is
%   your recessive personality type. If it starts with an uppercase, then
%   it is your dominant personality type.
%
%   You also know your personality subtype from a different personality
%   test. To be thorough in your code you wanted to add it as well. Your
%   subtype can be either 'alone', 'smallGroup', or 'largerGroup' (those
%   will be the exact input strings). If it is alone add '_a' to the end of
%   your dominant personality type. If it is smallGroup add '_s' to the end
%   of your dominant personality type. If it is large group add '_l' to the
%   the end of your dominant personality type.
%
% Notes:
%   - All outputs have to be capitalized.
%   - There will always be ten personality types in the form 'Type1 Type2
%     Type3', but you do not know the names or order of the personality types.
%   - The ten personality types will always be capitalized.
%   - Your third output is the two wing personalities, these will be in
%     the order: [leftWing rightWing]
%
% Test Cases:
%       type1 = 'helper';
%       pVec1 = ['Reformer Helper Achiever Individualist Dreamer Investigator ...
%                 Loyalist Enthusiast Challenger Peacemaker'];
%       subType1 = 'alone';
%       [dom1, rec1, wings1] = personalityTest(type1,pVec1,subType1);
%           dom1 => 'Loyalist_a'
%           rec1 => 'Helper'
%           wings1 => 'Enthusiast Investigator'
%
%       type2 = 'Dreamer';
%       pVec2 = ['Achiever Individualist Dreamer Investigator Loyalist ...
%                 Enthusiast Challenger Peacemaker Reformer Helper'];
%       subType2 = 'smallGroup';
%       [dom2, rec2, wings2] = personalityTest(type2,pVec2,subType2);
%           dom2 => 'Dreamer_s'
%           rec2 => 'Peacemaker'
%           wings2 => 'Investigator Individualist'
%
%       type3 = 'Challenger';
%       pVec3 = ['Peacemaker Reformer Helper Achiever Individualist Dreamer ...
%                 Investigator Loyalist Enthusiast Challenger'];
%       subType3 = 'largeGroup';
%       [dom3, rec3, wings3] = personalityTest(type3,pVec3,subType3);
%           dom3 => 'Challenger_d'
%           rec3 => 'Individualist'
%           wings3 => 'Peacemaker Enthusiast'
%

%translating the string into an array
numstore = double(personality);
[first rest] = strtok(orderedpersonality , ' ');
[second rest1] = strtok(rest , ' ');
[third rest2] = strtok(rest1 , ' ');
[fourth rest3] = strtok(rest2 , ' ');
[fifth rest4] = strtok(rest3 , ' ');
[sixth rest5] = strtok(rest4 , ' ');
[seventh rest6] = strtok(rest5 , ' ');
[eighth rest7] = strtok(rest6 , ' ');
[nineth rest8] = strtok(rest7 , ' ');
[tenth ~] = strtok(rest8 , ' ');

traits = {first,second,third,fourth,fifth,sixth,seventh,eighth,nineth,...
    tenth}

%Determining if the first digit is lower case
if numstore(1) >= 'a' && numstore(1) <= 'z'
    %If the first digit of personality is lower case then it converts it to
    %an upper case digit
    if personality(1)>='a' & personality(1) <='z'
        personality(1) = upper(personality(1));
        location =1;
        %Scanning the array to determine where the personality trait is
        %located in the array
        while location <= length(traits)
            if  ismember( personality, traits(location))
                %Storing the location of the matching trait
                store1= (location)
                location = location +1;
            else
                location = location +1;
            end
        end
    end
    %Determining the recessive trait by subtracting 5 from the dominate trait
    dom = store1-5
    %if the recessive trait falls out of the array...
    if dom <=0
        store2 = 10+dom
    else
        store2=dom
    end
    %sets the traits based on the information known
    dominant = char(traits(store2))
    recessive = char(traits(store1))
    twowing = [char(traits(store2+1)) char(' ') char(traits(store2-1))]
    
    %if the first digit is upper case
else
    location =1;
    while location <= length(traits)
        %determining where the personality trait is located in the array
        if  ismember( personality, traits(location))
            %location of matching value
            store1= (location)
            location = location +1;
        else
            location = location +1;
        end
    end
    
    
    %determining the recessive location
    dom = store1-5;
    %if the recessive trait falls out of the array
    if dom <=0
        store2 = 10+dom;
    else
        store2=dom;
    end
    %setting the dominate and recessive based on the known info
    dominant = char(traits(store1));
    recessive = char(traits(store2));
    
    %Determining the wing values
    store3 = store1;
    
    %checking to see if the wings fall off the array
    if store1+1 >10
        store1 = store1+1 - 10
    else
        store1 = store1+1;
    end
    
    if store3-1 <0
        store3 = store3-1 + 10
    else
        store3 = store3-1;
    end
    %setting the wing
    twowing = [char(traits(store1)) char(' ') char(traits(store3))];
end

%determining the suffix which should be attached to the dominate trait
if strcmp(subtype, 'smallGroup')
    dominant = strcat(dominant,'_s')
elseif strcmp(subtype, 'alone')
    dominant = strcat(dominant, '_a')
elseif strcmp(subtype, 'largeGroup')
    dominant = strcat(dominant, '_l')
end

end

