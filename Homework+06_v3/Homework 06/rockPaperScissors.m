function [ winner ] = rockPaperScissors( firstp, secondp )
% Function Name: rockPaperScissors
%
% Inputs (1):  - (char) A string containing the first player's moves
%              - (char) A string containing the second player's moves
%
% Outputs (1): - (char) A string that says who won the game
%
% Function Description:
%   The age old game of Rock-Paper-Scissors is making its way into the
%   world of MATLAB!
%   This is a hand game played by two people, where players simultaneously
%   form one of three shapes with their hand, and the three shapes form a
%   triangle such that someone always wins! (Unless both players play the
%   same thing...)
%   Scissors beats Paper, Paper beats Rock, Rock beats Scissors:
%
%                     Scissors ----->  Paper
%                        ^               /
%                         \             /
%                          \           /
%                           \         /
%                            \       /
%                             Rock <-
%
%   Since playing only one round of this game isn't quite thrilling enough,
%   this game will be played best two out of three. The first input will
%   contain the first players moves for each respective round in the format
%   'Rock,Paper,Scissors', or any combination of the three. 'Rock' would be
%   the players first move, Paper the second, and so forth. The same format
%   applies to the second input (the second player's moves).
%
%   To win the overall game (where the game consists of three rounds), a
%   player must win two of those three rounds. Due to the possibility of
%   ties, it is not guaranteed that there will always be a winner. (For
%   example, if the two players tied in two of the rounds, then no one has
%   won the game yet, because neither player has reached two wins.)
%
%   Here is an example match:
%      Player1 -> 'Rock,Scissors,Scissors'
%      Player2 -> 'Paper,Rock,Scissors'
%
%      Round 1: Player 2 beats Player 1, because Paper beats Rock.
%      Round 2: Player 2 beats Player 1, because Rock beats Scissors.
%      Round 3: both players selected the same thing and is a draw.
%
%      As a result, Player 2 has two wins, and Player 1 has none. Player 2
%      has reached the two wins required to win the game, and so your
%      function would output 'Player 2 wins!'.
%
%   The output of your function should always be one of the following:
%      - 'Player 1 wins!'   if Player 1 wins the game
%      - 'Player 2 wins!'   if Player 2 wins the game
%      - 'Keep Playing!'    if neither player has won 2 rounds yet
%
% Notes:
%   - The first letter in each move will always be capital
%   - The character separating a player's moves in the input will always be
%     a comma (and no space).
%   - The output string must match exactly to one of the above outputs
%     (case matters!)
%   - Each input will contain exactly three moves.
%
% Hints:
%   - Your code should be pretty repetitive, so take advantage of copy and
%     paste.
%
% Test Cases:
%
%   [winner1] = rockPaperScissors('Rock,Scissors,Scissors', ...
%                                 'Paper,Rock,Scissors')
%               winner1 => 'Player 2 Wins!'
%
%   [winner2] = rockPaperScissors('Paper,Paper,Rock', ...
%                                 'Rock,Scissors,Rock')
%               winner2 => 'Keep Playing!'
%
%   [winner3] = rockPaperScissors('Paper,Paper,Scissors', ...
%                                 'Scissors,Rock,Paper')
%               winner3 => 'Player 1 Wins!'
%
%

%Extracting the three values for the game from the first player
[first rest] = strtok(firstp,',');
[second rest1] = strtok(rest,',');
[third ~] = strtok(rest1,',');

%Extracting the three values for the game from the second player
[first1 rest2] = strtok(secondp,',');
[second1 rest3] = strtok(rest2,',');
[third1 ~] = strtok(rest3,',');

%setting the players default scores
p1score =0;
p2score =0;

%Comparing the first set of values
if strcmp(first,first1) == false
    if strcmp(first,'Scissors') & strcmp(first1,'Paper')
        p1score = p1score+1;
    elseif strcmp(first,'Paper') & strcmp(first1,'Rock')
        p1score =p1score+1;
    elseif strcmp(first,'Rock') & strcmp(first1,'Scissors')
        p1score = p1score+1;
    elseif strcmp(first1,'Scissors') & strcmp(first,'Paper')
        p2score = p2score+1;
    elseif strcmp(first1,'Paper') & strcmp(first,'Rock')
        p2score =p2score+1;
    elseif strcmp(first1 ,'Rock') & strcmp(first,'Scissors')
        p2score = p2score+1;
    elseif strcmp(first1 ,'Rock') & strcmp(first,'Paper')
        p2score = p2score+1;
        
        
    end
end

%Comparing the second set of values
if strcmp(second,second1) == false
    if strcmp(second,'Scissors') & strcmp(second1,'Paper')
        p1score = p1score+1;
    elseif strcmp(second,'Paper') & strcmp(second1,'Rock')
        p1score =p1score+1;
    elseif strcmp(second,'Rock') & strcmp(second1,'Scissors')
        p1score = p1score+1;
    elseif strcmp(second,'Rock') & strcmp(second1,'Paper')
        p1score = p1score+1;
    elseif strcmp(second1,'Scissors') & strcmp(second,'Paper')
        p2score = p2score+1;
    elseif strcmp(second1,'Paper') & strcmp(second,'Rock')
        p2score =p2score+1;
    elseif strcmp(second1 ,'Rock') & strcmp(second,'Scissors')
        p2score = p2score+1;
    elseif strcmp(second1 ,'Rock') & strcmp(second,'Paper')
        p2score = p2score+1;
        
        
    end
end
%Comparing the third set of values
if strcmp(third,third1) == false
    if strcmp(third,'Scissors') & strcmp(third1,'Paper')
        p1score = p1score+1;
    elseif strcmp(third,'Paper') & strcmp(third1,'Rock')
        p1score =p1score+1;
    elseif strcmp(third,'Rock') & strcmp(third1,'Scissors')
        p1score = p1score+1;
    elseif strcmp(third,'Rock') & strcmp(third1,'Paper')
        p1score = p1score+1;
    elseif strcmp(third1,'Scissors') & strcmp(third,'Paper')
        p2score = p2score+1;
    elseif strcmp(third1,'Paper') & strcmp(third,'Rock')
        p2score =p2score+1;
    elseif strcmp(third1 ,'Rock') & strcmp(third,'Scissors')
        p2score = p2score+1;
    elseif strcmp(third1 ,'Rock') & strcmp(third,'Paper')
        p2score = p2score+1;
    end
end

%Determining the winner
if p1score == p2score
    winner = 'Keep Playing!';
elseif p1score > p2score
    winner = 'Player 1 wins!';
elseif p1score+p2score <3
    winner = 'Keep Playing!';
else
    winner = 'Player 2 wins!';
end
end

