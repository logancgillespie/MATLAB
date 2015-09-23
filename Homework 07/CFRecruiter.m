function [ possibletohire, totaltime ] = CFRecruiter( names, gpas, talk )
%
% Inputs (3):  - (char) A string of strudent names, separated by comma-space.
%              - (double) A vector of GPAs, corresponding to the students
%                         in the first input.
%              - (logical) A logical vector of whether or not each student
%                          stays to talk.
%
% Outputs (2): - (char) A string of possible candidates to hire.
%              - (double) The total time spent the recruiter spends talking
%                         to students.
%
% Function Description:
%   Imagaine you are a recruiter at the Career Fair for a big-name company:
%   a bunch of students are waiting in the line to talk with you, and you
%   don't have time to talk to everybody. You're not even going to bother
%   talking to students whose GPA doesn't meet the minimum to work for your
%   company (which is a 2.5), and there are some students who don't even
%   stay to talk, they just hand in their resume and leave!
%
%   Write a function that takes in a string of names separated by a
%   comma-space (', '), a vector of these students GPAs, and a logical
%   vector of whether or not they stick around to talk. Output a string of
%   the names of possible candidates for your company (students with GPAs
%   higher than your minimum who stayed there to talk), and output the
%   number of minutes spent talking to these students. The time you spend
%   talking to each student will vary, but it will generally follow the
%   formula:
%
%           Time in minutes = (GPA - 2.5) * 4;
%
% Notes:
%   - Do not round/ceil/floor the output time.
%   - In the string, names are seperated by ', ', so the string would look
%     like 'Jack, Emily, Sam Lin, Will Brown'. Your output should be
%     exactly the same format as the input, but with fewer names.
%   - It is guaranteed there will be at least one name in your output string.
%   - Use strtok wisely, and deal with ' ' and ',' carefully. Your output
%     needs to be exactly the same as the output from CFRecruiter_soln.p
%
% Test Cases:
%
%       [Names, Time] = CFRecruiter('Jack, Rose, Tom', [3.9, 2.3, 3.3],...
%                                   [false true true])
%           => Name = 'Tom'
%              Time = 3.2000
%
%       [Names, Time] = CFRecruiter('Gatech, George Burdell, Barnes Noble',...
%                                   [4.0, 2.5, 3.6], [true true true])
%           => Name  = 'Gatech, Barnes Noble'
%              Time  = 10.4000
%
%
%taking out the names and storing them in values of an array for easy
%indexing
index =1;
arrayout=[];
while find(names,',')
    [out1 names] = strtok(names,',');
    arrayout=[arrayout {out1}]
    index=index+1;
end

%loop setup
index1=1;
array1out=[];
storevalues = [];
%while the index is less than the length of the array calculate if the gpa
%and talk variables meet the requirements for each array index
while index1 <= length(arrayout)
    if(gpas(index1) >2.5 && talk(index1) == true)
        if(length(storevalues) <1)
            array1out = strcat(array1out, arrayout(index1));
        else
            array1out=strcat(array1out, ',', arrayout(index1));
        end
        storevalues = [storevalues index1]
        index1=index1+1;
        %if not continue to index
    else
        index1=index1+1;
    end
    
end
%output a string from the array of possible names
possibletohire = char(array1out);

%Determining the amount of time spoken to each person based on GPA

%setup
index2 = 1;
totaltimepossible =[];
gpas(storevalues(index2));
%calculating the time based on the given function and concatinating into a
%string which is output in totaltime
while index2<= length(storevalues)
    gpacalc=((gpas(storevalues(index2))- 2.5) .* 4);
    totaltimepossible=[totaltimepossible gpacalc];
    index2=index2+1;
end
totaltime=double(sum(totaltimepossible));
end

