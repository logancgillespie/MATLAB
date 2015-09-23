function [ snoozetime ] = snoozeTime( fallasleep, alarmset,...
    lengthofsnooze, firstclass)
% Function Name: snoozeTime
%
% Inputs (4):  - (char) The time at which you fall asleep
%              - (char) The time for which your alarm is set
%              - (double) The length of your clock's snooze function (mins)
%              - (char) The time of your first class
%
% Outputs (1): - (double) An integer of how many times you can "snooze"
%
% Function Description:
%   It's been another late night studying for midterms and coding matlab,
%   but, alas, it is finally time to hit the sack (hooray!).  In
%   preparation for your big test day tomorrow, one of the last things you
%   want to do before falling asleep is to determine how many times you can
%   hit the snooze button in the morning.  You want at least 8 hours of
%   sleep, if possible (but no more in case you want to do some last minute
%   studying in the morning). However, you must wake up at least 20 minutes
%   before your first class starts, and if this means less than 8 hours of
%   sleep then you'll just have to be sleep deprived.  So how many times
%   can you snooze? Take into account the time you begin to sleep (after
%   midnight, of course), the time your alarm is set, the length of your
%   clock's snooze function, and the time of your first class to
%   iteratively determine how many times you can Keep the Dream Alive!
%
% Notes:
%   - All times will be written on a 24 hour scale. So a time 1:40 pm would
%     be a string of '13:40'.
%   - You must "wake up" at least 20 minutes before your first class. If
%     hitting snooze again would put you past that, then you cannot hit
%     snooze again.
%   - It is guaranteed that the time your alarm is set for will always be
%     at least 20 minutes before your first class starts.
%   - Time spent snoozing counts as "sleeping". Your function should stop
%     hitting snooze at 8 hours past your bedtime (if applicable). Your
%     function should always return 0 if your "alarm time" (the 2nd input)
%     is more than 8 hours after your "bedtime" (the 1st input).
%
% Hints:
%   - Don't forget that time is not measured in 100's (but 60's)
%
% Test Cases:
%
%   [numberOfSnoozes1] = snoozeTime('3:25', '9:05', 10, '10:00');
%       numberOfSnoozes1 = 3;
%
%   [numberOfSnoozes2] = snoozeTime('0:00', '6:30', 7, '8:00');
%       numberOfSnoozes2 = 10;
%
%   [numberOfSnoozes3] = snoozeTime('1:05', '9:20', 5, '10:30');
%       numberOfSnoozes3 = 0;
%

%Using strtok to extract the values of the given times and convert them to
%double values
[fallasleephour restsleep]=strtok(fallasleep,':');
[fallasleepminute ~]=strtok(restsleep, ':');
fallasleephour = str2num(fallasleephour);
fallasleepminute = str2num(fallasleepminute);

[alarmsethour restalarm]=strtok(alarmset,':');
[alarmsetminute ~]=strtok(restalarm, ':');

alarmsethour = str2num(alarmsethour);
alarmsetminute = str2num(alarmsetminute);

[firstclasshour restclass]=strtok(firstclass,':');
[firstclassminute ~]=strtok(restclass, ':');

firstclasshour = str2num(firstclasshour);
firstclassminute = str2num(firstclassminute);

%determining the total amount of minutes the person spent in each 'phase'
%of the sleep cycle
fallasleeptotalminutes= fallasleephour*60 + fallasleepminute;
alarmsettotalminutes= alarmsethour*60 + alarmsetminute;
totalsleeptime=(alarmsettotalminutes-fallasleeptotalminutes)/60;
firstclasssnoozetime= ((firstclasshour*60) + firstclassminute)...
    -alarmsettotalminutes-20;

%if the total sleep time is less than 8 hours the person can't snooze
if(totalsleeptime >8 | totalsleeptime <=0 | firstclasssnoozetime <=0)
    snoozetime =0;
%otherwise the snooze is calculated below
else
    snoozetime = floor(firstclasssnoozetime./lengthofsnooze);
    
end
end

