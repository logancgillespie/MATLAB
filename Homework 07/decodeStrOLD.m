
if find(coded ,' ')
    index = 1;
    while index <= length(coded)
        if(coded(index) == ' ' && coded(index+1) == ' ')
            coded(index) = [];
        else
            index = index +1;
        end
    end

    
   codedspace= coded==' '
   length1 =1;
   counter=0;
   location = 0;
   length0=0;
   while length1<= length(codedspace) && length0 <=pull
   if(codedspace(length1)==1)
       location = length1
       length0= length0+1
       length1 = length1 +1;
   else
       length1 = length1 +1;
   end
   end
   
   
 location =1;

%decoded = coded((1:coded(1)))
%decoded1 = 
else 
    decoded = 'b';
end

  decoded = 'b';


%while location <= length(coded)
%[one coded] =strtok(coded,' ');
%decoded1(end+1) = one;
%location = location +1;