function [ victoriousside, winningplayerhits, tanksdestroyed ]...
    = battleTanks( player1tank, player2tank, stringbattle )
% Function Name: battleTanks
%
% Inputs (3):  - (double) An array of Player 1's field of tanks
%              - (double) An array of Player 2's field of tanks
%              - (string) A string detailing the battle (ex: 'A7 B4 C3')
%
% Outputs (3): - (double) An 8x8 array of the victorious side in the battle.
%                         (Or an array of the first players's field.)
%              - (double) A vector detailing the winning players's hits, in
%                         order.
%                         (Or an array of the second player's field.)
%              - (varies) A vector detailing what tanks the winning player
%                         destroyed, in order.
%                         (Or the string 'Cease Fire!')
%
% Function Description:
%  When you were little, you may have heard of the game Battleship (if not
%  then see the Hints section of this problem statement for a linked
%  description). Well unfortunately, ships are slow, boring and not nearly
%  as cool as tanks. Now you get to play with tanks, because you're old
%  enough to make your own choices and tanks are awesome. Unfortunately, we
%  don’t have the budget to give you real tanks for this homework
%  assignment, so instead you get to write a Matlab function simulating a
%  game of BattleTanks!
%
%  Your function will take three inputs: the first two are arrays that show
%  how each player has laid out their tanks on their field. The third
%  input is a string of the moves made in the game, containing the moves of
%  both players. The two arrays will always be 8x8 arrays, and the
%  different tanks on the field will be indicated by numbers 1 through 4
%  (and empty space will just be 0's). The string of moves will be of the
%  form: 'A7', where the letter A indicates the column and the number 7
%  indicates the row. If the first player makes the move 'A7', then that
%  means he/she will hit any tank that is located at column 1 and row 7 of
%  the enemy's field.
%
% Battle Details:
%
%  - The battlefield will be an 8x8 array with up to 4 tanks represented.
%    Tanks may be aligned horizontally or vertically. A heavy
%    tank is 3x2, and represented by the number 4. A medium tank is 2x2,
%    represented by the number 3. A tank destroyer is 3x1, represented by
%    the number 2. A light tank is 2x1, represented by the number 1. 0
%    represents empty space.
%
%  - The string detailing the battle will be a string of which coordinates
%    in the opponent's battlefield a player "shoots at". This input string
%    will be of the form: 'A7 B4 F6', where moves are separated by a space.
%    For each move the letter (A through H) refers to the column (1 through
%    8 respectively), and the number refers to the row. The first player
%    will always make the first move, and moves will then alternate between
%    players for the full length of the string. There is no guarantee that
%    both players will make the same number of moves, and there is no
%    guarantee that all the moves in the string will be used before the
%    battle ends.
%
%  - You must keep track of the order in which each player hits the
%    opponent's tanks, and also keep track of the order in which each player
%    destroys the opponent's tanks. (Keep track of the numbers representing
%    the tanks, not the tank names.) A tank is destroyed when every index
%    of that tank in a player's array has been hit by the enemy.
%
% Winning conditions:
%
%  - If one player destroys all of the opponent's tanks, then they have won.
%
%  - If neither side has lost all their tanks after all moves have been
%    played, the winner is determined by the number of hits scored on the
%    enemy fleet (NOT the number of tanks they destroyed). It is thus
%    possible to win but not destroy any tanks.
%
%  - The game is allowed to end in a tie. If all of the moves in the input
%    string have been made, and each player has the same number of hits on
%    the other, then the game will be a tie. In the event of this, the
%    outputs of the function will become the secondary outputs described in
%    parentheses at the top of this problem statement: 1) the 1st players
%    final 8x8 array, 2) the 2nd players final 8x8 array, and 3) a string,
%    'Cease fire!'.
%
% Rules of Engagement:
%  - Collateral damage is not allowed. No coordinates will be given that do
%    not land within the 8x8 grid. That is, no letter after H in
%    alphabetical order and no number greater than 8 will be given.
%  - Incompetent players are allowed make the same move multiple times.
%    However, it can only count as a "hit" the first time they make the
%    move.
%  - The battlefield will always be 8x8.
%  - Players are not required to play all their tanks. But if they only have
%    one tank out there, and that one tank gets destroyed, then they lose.
%  - There will be no duplicate tanks, eg. two light tanks will not be on
%    the same side.
%  - In your output arrays, any place where a tank has been hit but not
%    destroyed should be represented by a 0. So there may be "jagged tanks"
%    in an output array.
%
% Hints:
%   - A helper function may be written in the same file, but following the
%     "end" of the main function. This is a function that can be called
%     from the main function, but not the command window, and can be very
%     helpful for performing repeated tasks.
%   - If you have no idea what the heck this problem is asking because you
%     have no idea what Battleship is, then go this URL:
%     http://en.wikipedia.org/wiki/Battleship_(game)
%
% Test Cases:
%
%      load('battleTanks.mat')
%
%      [results1, winHits1, winDestroy1] = battleTanks(battleAP1,battleAP2,moveA)
%           => results1 should be the same as resultsA (which is saved in battleTanks.mat)
%              winHits1 = [1 1 2 2 2 3 3 3 3]
%              winDestroy1 = [1 2 3]
%
%      [results2, winHits2, winDestroy2] = battleTanks(battleBP1,battleBP2,moveB)
%           => results2 should be the equal to resultsB1 (in .mat file)
%              winHits2 should be the equal to resultsB2 (in .mat file)
%              winDestroy2 = 'Cease fire!'
%


stringbattle1= stringbattle;
mask = stringbattle >='A' & stringbattle<='H';
mask2 = stringbattle >=1 & stringbattle <=9;

%removing numbers from stringbattle
stringbattle(mask2) = '';

%converting the remaining letters in the string to ASCII values and then
%subtracts 64 from them converting A to 1 B to 2 ....
stringbattle = stringbattle(mask) -64;

%setting stringbattle1 equal to the numbers from stringbattle
stringbattle1 = stringbattle1(~mask);
stringbattle1 = str2num(stringbattle1);

%Initializing values
player1hitcount =[];
player1sink =[];
player1hits = [];
player2hitcount =[];
player2sink =[];
player2hits = [];

%Iterating through the values of stringbattle1
for index=1:length(stringbattle1)
    %Determing which players turn it is, odd player 1, even player 2
    
    %Player 1
    if(mod(index,2) ==0)
        
        %determine if the value represented in the array at
        %stringbattle1,stringbattle is not zero
        player1tank(stringbattle1(1,index),stringbattle(1,index))
        if player1tank(stringbattle1(1,index),stringbattle(1,index))~=0
            %Storing the value in stringbattle1,stringbattle
            num2=double(player1tank(stringbattle1(1,index),stringbattle(1,index)));
            
            %storing the value as a hit on player2
            player2hits= [player1hits ' ' num2str(player1tank(...
                stringbattle1(1,index),stringbattle(1,index)))]
            %Setting the value as zero
            player1tank(stringbattle1(1,index),stringbattle(1,index)) = 0;
            %Storing the value as a hit
            player1hitcount = [player1hitcount num2];
            
            %determining if that was the last value in the array
            if player1tank(stringbattle1(index),stringbattle(index))...
                    == 0 & ~any(player1tank(:)==num2)
                %if this condition is true then the value of the tank is
                %stored in player1 sink
                player1sink= [ player1sink num2]
            end
        end
        % for the even index values
    else
        num1=1;
        %check if the value at stringbattle1,stringbattle isn't zero
        if player2tank(stringbattle1(index),stringbattle(index))~=0
            %if it isn't store the value in player1hits
            player1hits= [player1hits ' ' num2str( player2tank...
                (stringbattle1(1,index),stringbattle(1,index)))];
            %save the number
            num1=double(player2tank(stringbattle1(1,index),stringbattle...
                (1,index)));
            %set the location to zero
            player2tank(stringbattle1(index),stringbattle(index)) = 0;
            %...player2tank(stringbattle1(index),stringbattle(index))-1;
            %store the value as a hit in hitcount
            player2hitcount = [player2hitcount num1]
            
            
            if player2tank(stringbattle1(index),stringbattle(index))...
                    == 0 & ~any(player2tank(:)==num1)
                %if the tank number which was just hit no longer exists in 
                %the array then it is saved as a sink
                player2sink=[player2sink num1];
                
            end
            
        end
    end
end

%Determination of winner
%if one persons tanks are completley eliminated the other person is
%automatically the winner
if(player1tank(:) ==0)
    victoriousside = player2tank;
    winningplayerhits = player1hitcount;
    tanksdestroyed = player1sink;
elseif (player2tank(:) ==0)
    victoriousside = player1tank;
    winningplayerhits = player2hitcount;
    tanksdestroyed = player2sinkl
elseif( length(player2sink) > length(player1sink))
    victoriousside = player1tank;
    winningplayerhits = player2hitcount;
    tanksdestroyed = player2sink;
elseif(length(player1hitcount) > length(player2hitcount))
    victoriousside=player2tank;
    winningplayerhits = player1hitcount;
    tanksdestroyed = player1sink;
else
    victoriousside='Cease fire!';
    winningplayerhits = player1tank;
    tanksdestroyed = player2tank;
end
end