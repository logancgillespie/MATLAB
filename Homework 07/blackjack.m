function [ winner ] = blackjack( cardseed, strategyarray )

% Inputs (2):  - (double) A random integer that indicates a card seed to be
%                         fed to the dealer.p function
%              - (double) The strategyArray variable loaded from
%                         'blackjackStrategy.mat'
%
% Outputs (1): - (char) A string telling who won the game
%
% Function Description:
%   You've seen the movies. You've heard the stories. Now it's time for you
%   to win big playing blackjack!! Except not actually. Because gambling is
%   bad and you're a broke college student. So instead you decide to write
%   a Matlab function to play blackjack for you without any financial
%   reprecussions.
%
%   If you do not know how to play blackjack, you can read the Wikipedia
%   article here: http://en.wikipedia.org/wiki/Blackjack, but here is a
%   brief summary of what you need to know:
%
%   Blackjack is a game played between one player and a dealer, and either
%   the player or the dealer wins. The objective of the game is to get a
%   hand of cards that adds up to as close to 21 as possible, but dooesn't
%   go over. The dealer deals out 4 cards to start the game: two to the
%   player and 2 to themself. The player can obviously see both of their
%   own cards, and is also shown 1 of the dealer's card. They player then
%   decides from the sum of their two cards and the card shown by the
%   dealer whether they should "hit" or "stay". "Hit" means the dealer
%   gives the player another card to increase the sum of their hand, and
%   "stay" means that the player is already close to 21 and does not want
%   to risk going over. The player can decide to "hit" as many times as
%   they would like, but should they go over 21 they will automatically
%   lose. If the player decides to "stay" without going over 21, then the
%   dealer will reveal their 2nd card, and also "hit" until they get as
%   close to 21 as possible. If the dealer goes over 21, then the player
%   wins. Besides this, whoever is closer to 21 wins.
%
%   The "dealer" for this problem will be a function, dealer.p, that is
%   included with the homework. For everything the dealer would normally do
%   in a real blackjack game, you have the dealer.p function:
%
%  |----------------------- Explanation of dealer.p -----------------------
%  |
%  |[dealerUpCard,playerCard] = dealer(action,[cardSeed])
%  |
%  |    Inputs:
%  |     - action: this input is a string input that can be 'start', 'hit',
%  |        or 'stay'. 'start' refers to the deal at the start of the game,
%  |        'hit' refers to the player deciding to hit and requesting another
%  |        card, and 'stay' refers to the player ending their turn.
%  |     - cardSeed: This input is necessary if your first input is 'start', but
%  |        is optional and will not be used by the function for other
%  |        first-inputs. This should be the exact same cardSeed input to
%  |        your blackjack.m function, and fed to dealer.p to make sure that your
%  |        file and the solution file will be dealt the same cards for the
%  |        same test cases.
%  |
%  |    Outputs:
%  |    The outputs of dealer.p will vary depending on the action it is
%  |    called for.
%  |
%  |    When the input is 'start':
%  |    - dealerUpCard: the numeric value of the dealer's shown card
%  |    - playerCard: a 1x2 vector of the 2 numeric values of the player cards
%  |
%  |    When the input is 'hit':
%  |    - dealerUpCard: will still be numeric value of the dealer's up card
%  |    - playerCard: the numeric value of the new card the player was dealt
%  |
%  |    When the input is 'stay':
%  |    - dealerUpCard: a 1xN vector of the dealer's final hand, after they
%  |                    have either gone over 21 or decided to stay
%  |    - playerCard: an empty vecor
%  |
%  |-----------------------------------------------------------------------
%
%   You are also given an array containing the optimal blackjack strategy.
%   You will use this to determine whether to hit or stay given what your
%   hand adds up to and what card the dealer is showing. This array is
%   saved in 'blackjackStrategy.mat'. Double click on the file to load the
%   contents. The matrix it contains is as shown, and is a variable
%   named strategyArray:
%
%                     Dealer Up Card
%     Player Hand |  2,3,4,5,6,7,8,9,10,A (which will be represented by 11)
%     ____(sum)___|___________________________
%     17-20       | [0,0,0,0,0,0,0,0, 0,0;...
%     13-16       |  0,0,0,0,0,1,1,1, 1,1;...
%     12          |  1,1,0,0,0,1,1,1, 1,1;...
%     <11         |  1,1,1,1,1,1,1,1, 1,1]
%
%
%   A value of 1 means 'hit' and 0 means 'stay'. For example, the value at
%   the intersection of the player's cards summing to 12 and the dealer
%   having an up card of 6 is 0, so the optimum strategy at that point in
%   the game is to stay. However, if the player's cards summed to 12 but
%   the dealer had an up card of 9, the array has a value of 1 meaning that
%   you should hit. If you happen to know blackjack strategy, do not
%   worry about the fact that this doesn't account for a "soft hand", and
%   please use this array for your function's strategy.
%
%   Face cards in the deck will merely be represented by the number 10, as
%   that is their value in blackjack (don't worry, there are lots of 10's
%   in the dealer's deck to account for all the face cards). Aces will be
%   represented by the number 11. Aces in blackjack can always either take
%   a value of 11 or 1. You should always treat aces as having a value of
%   11 for this problem, until you go over 21. If you go over 21, you
%   should have a condition to check if you have an aces, and to change
%   its value to 1 if you do. You would then reevaluate whether to hit or
%   stay with the new sum of your hand.
%
%   The function that you write should iterate through a game of blackjack
%   using the dealer.p function, and using the strategy contained in the
%   matrix above. The output should be a string of the outcome of the game:
%   either 'The dealer wins :(' if the dealer wins the game, or 'The player
%   wins!' if the player wins the game. One final note: if you are dealt a
%   hand adding up to 21 at the start of the game, then you should output
%   'Blackjack!'.
%
% Notes:
%   - Do not try to 'reverse engineer' the card order that the helper
%     function outputs. You will spend more time doing that then it'd take
%     to actually code the problem, and we will use a different predefined
%     deck to run the autograder anyway.
%   - A single game of blackjack only lasts until the player decides to
%     stay and the dealer shows their hand. The winner is then decided.
%   - If the player and dealer's hand add up to the same thing, then the
%     dealer wins.
%   - Output 'Blackjack!' if your hand adds up to 21 at the start of the
%     game, but NOT if you get a hand that adds up to 21 by "hitting".
%
% Hints:
%   - Think about how to use the strategy matrix to determing the iteration
%     ending condition.
%   - Try to simplify the logic of the game as much as possible.
%
% Test Cases:
%   You will definitely want to check your code against the solution .p
%   file with many other cardSeed values to make sure your function is
%   working correctly, but here are a few test cases that you can use in
%   the mean time:
%
%       winner1 = blackjack(18,strategyArray)
%           => winner1 = 'The player wins!'
%
%       winner2 = blackjack(78,strategyArray)
%           => winner2 = 'The dealer wins :('
%
%       winner3 = blackjack(79,strategyArray)
%           => winner3 = 'The player wins!'
%
%       winner4 = blackjack(3,strategyArray)
%           => winner4 = 'Blackjack!'
%
%

[dealerUpCard, playerCard] = dealer('start', cardseed);
dealersum =dealerUpCard;
playersum = playerCard;
acemask = playersum ==11
index=1;
if playersum == 21
    winner = 'Blackjack';
    
else
    while sum(dealersum) <=21
        
        if playersum >=17 & playersum <= 20
            %added code to check for 11
            if dealersum(index) ==11 & sum(dealersum<=21)
                arrstore = 1
            elseif dealersum(index) ==11 & sum(dealersum>21)
                playersum(acemask) = 1;
                if(sum(playersum) <=21)
                    arrstore = 1;
                else
                    arrstore =0;
                end
            else
                arrstore = strategyarray(2,dealersum(index))
            end
            %end added code
            if arrstore ==1
                [dealerUpCard, playerCard1] = dealer('hit', cardseed)
                playersum = [playersum playerCard];
                dealersum = [dealersum dealerUpCard]
                
                
            else
                [dealerUpCard, ~] = dealer('stay', cardseed);
                dealersum = [dealersum  dealerUpCard];
            end
            %row1
        elseif playersum >=13 & playersum <= 16
            %added code to check for 11
            if dealersum(index) ==11 & sum(dealersum<=21)
                arrstore = 1
            elseif dealersum(index) ==11 & sum(dealersum>21)
                playersum(acemask) = 1;
                if(sum(playersum) <=21)
                    arrstore = 1
                else
                    arrstore =0;
                end
            else
                arrstore = strategyarray(3,dealersum(index))
            end
            %end added code
            if arrstore ==1
                [dealerUpCard, playerCard1] = dealer('hit', cardseed)
                playersum = [playersum playerCard1]
                dealersum = [dealersum dealerUpCard]
                
            else
                [dealerUpCard, ~] = dealer('stay', cardseed)
                 dealersum = [dealersum dealerUpCard]
            end
            %row2
            
        elseif playersum == 12
            %added code to check for 11
            if dealersum(index) ==11 & sum(dealersum<=21)
                arrstore = 1
            elseif dealersum(index) ==11 & sum(dealersum>21)
                playersum(acemask) = 1;
                if(sum(playersum) <=21)
                    arrstore = 1
                else
                    arrstore =0;
                end
            else
                arrstore = strategyarray(3,dealersum(index))
            end
            %end added code
            if arrstore ==1
                [dealerUpCard, playerCard1] = dealer('hit', cardseed)
                playersum = [playersum playerCard1]
                dealersum = [dealersum dealerUpCard]
            else
                [dealerUpCard, ~] = dealer('stay', cardseed)
                dealersum = [dealersum dealerUpCard]
            end
            %row3
            
        elseif playersum<=11
            %added code to check for 11
            if dealersum(index) ==11 & sum(dealersum<=21)
                arrstore = 1
            elseif dealersum(index) ==11 & sum(dealersum>21)
                dealersum(acemask) = 1;
                if(sum(playersum) <=21)
                    arrstore = 1
                else
                    arrstore =0;
                end
            else
                arrstore = strategyarray(4,dealerUpCard(index))
            end
            %end added code
            if arrstore ==1
                [dealerUpCard, playerCard1] = dealer('hit', cardseed)
                playersum = [playersum playerCard1]
                dealersum = [dealersum dealerUpCard]
                
            else
                [dealerUpCard, ~] = dealer('stay', cardseed)
                dealersum = [dealersum dealerUpCard]
            end
            index= index+1;
        end
       % playersum= sum(playersum)
        arrstore
        %dealersum = sum(dealersum)
        %row4
    end
    winner =1;
    
end
end
