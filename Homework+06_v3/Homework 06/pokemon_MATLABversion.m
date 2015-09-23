function [ outputsentence ] = pokemon_MATLABversion( pokestats, poketype, pokerevive )

% Function Name: pokemon_MATLABversion
%
% Inputs  (3): - (double) A 1x2 vector of your pokemon's attack and defense
%                         stats: [attack defense].
%              - (char) A string of the type of your pokemon.
%              - (double) An integer of how many "Revives" you have.
%                
% Outputs (1): - (char) A sentence describing the outcome of your pokemon
%                       challenge.
%
% Function Description:
%   Write a matlab function that simulates a pokemon game: where you
%   challenge 8 gym leaders to try and win, and if you beat all 8 you earn
%   the right to challenge the elite 4. For those of you unfamiliar with
%   pokemon: no pokemon knowledge is actually necessary to code this
%   problem, so don't worry.
%
%   Your function will have three inputs: (1) a 1x2 vector of your
%   pokemon's stats. This will simply be Attack and Defense stats, and will
%   be of the form: [attackStat defenseStat]. (2) A string of the type of
%   pokemon you have. And (3), an integer of how many "Revives" you have. A
%   "revive" is an item that one may use in pokemon games to revive a
%   fainted pokemon, and will be used in this problem to help you win
%   battles against gym leaders when your stats are not higher than theirs.
%
%   Firstly, your function will need to simulate a battle between your own
%   pokemon and a gym leader's pokemon. From there you may use whichever
%   approach you wish to repeat the simulation for the next gym leader, and
%   so on. Simulating a battle will be accomplished by comparing your own
%   pokemon's stats to those of the gym leader. The stats of all pokemon's
%   gym leaders have been included with the homework, and are saved in the
%   file gymStats.mat (calling the line of code: load('gymStats.mat') will
%   save the variables contained into your workspace). There are a two
%   different ways for your pokemon to win a battle:
%       1) Your pokemon's attack stat is higher than the opponent's defense
%          stat. This should always result in your pokemon winning the
%          battle.
%       2) Condition (1) is not met, but your pokemon's attack
%          stat is greater than 80% of your opponent's defense stat. In
%          this case, you have to use one of your revives win the battle.
%
%   If one of two above conditions is not met, then you will lose that
%   battle. If you lose against a gym leader, then you are not allowed to
%   challenge the following gym and that is the end of your pokemon
%   challenge.
%
%   Pokemon types will also play a part in this function. In pokemon, types
%   of pokemon define how some pokemon are just inherently strong against
%   others. For example, a water pokemon is inherently strong against a
%   fire pokemon, because water literally puts fires out. How this works
%   for this matlab problem is as such: if your pokemon's type is strong
%   against the opponent pokemon's type, then your stats will be multiplied
%   by 2 for that battle. If the opponent pokemon's type is strong against
%   your pokemon's type, then your stats will be multiplied by 0.5 for that
%   battle. The types of the 8 gyms you must face, and the types that are
%   strong against/weak to them are shown below:
%
%       Gym 1: Rock Type Gym
%           Strong types: Water, Grass, Fighting, Ground (2x multiplier)
%             Weak types: Flying, Bug, Fire, Ice (0.5x multiplier)
%
%       Gym 2: Water Type
%           Strong types: Grass, Electric (2x multiplier)
%             Weak Types: Ground, Rock, Fire (0.5x multiplier)
%
%       Gym 3: Electric Type
%           Strong types: --
%             Weak types: Flying, Water (0.5x multiplier)
%           Immune types: Ground (A Ground pokemon should always beat this gym)
%
%       Gym 4: Grass Type
%           Strong types: Flying, Poison, Bug, Fire, Ice (2x multiplier)
%             Weak types: Ground, Rock, Water (0.5x multiplier)
%
%       Gym 5: Poison Type
%           Strong types: Ground, Psychic (2x multiplier)
%             Weak types: Grass (0.5x multiplier)
%           Immune types: Steel (A Steel pokemon should always beat this gym)
%
%       Gym 6: Psychic Type
%           Strong types: Bug, Ghost (2x multiplier)
%             Weak types: Fight, Poison (0.5x multiplier)
%           Immune types: Dark (A Dark pokemon should always beat this gym)
%
%       Gym 7: Fire Type
%           Strong types: Ground, Rock, Water (2x multiplier)
%             Weak types: Bug, Steel, Grass, Ice (0.5x multiplier)
%
%       Gym 8: Ground Type
%           Strong types: Water, Grass, Ice (2x multiplier)
%             Weak types: Poison, Rock, Steel, Fire (0.5x multiplier)
%           Immune types: Flying (A Flying pokemon should always beat this gym)
%      Ineffective types: Electric (An Electric pokemon should always lose this gym battle)
%
%
%       *************************
%       The stats for each gym leader's pokemon are saved in gymStats.mat;
%       variable "stats1" is the first gym's stats, variable "stats2" is
%       the 2nd gym's stats, variable "stats3" is the third gym's stats,
%       etc. You will need to load this file in your function with the
%       following line of code:
%
%           load('gymStats.mat')
%
%       With the above line of code at the beginning of your function, you
%       will then be able to refer to the variables stats1, stats2, stats3,
%       etc.
%       *************************
%
%
%   Lastly: this function should also take Experience into account. So when
%   your pokemon wins a battle, you should add 20% of the opponents stats
%   to your own, and this change to your stats will be permanant. As in, it
%   won't go away after the battle ends (like your type multipliers
%   should).
%
%   Now you have everything you need to code this function: you have the
%   conditions for your pokemon to win a battle, the type
%   advantages/disadvantages for each gym, how much your pokemon's stats
%   should grow with each battle, and the stats of the gym leader's
%   pokemons saved in gymStats.mat. This function is lots and lots and lots
%   of conditional statements, but once you write the simulation for one
%   battle it is easy to write the rest. Now let's get to your outputs:
%
%   You need to output two things in this function. (1) A string telling
%   how you did, and (2) your pokemon's stats at the end of the function.
%   The output string will be as such:
%
%       Output string for losing to one of the gyms along the way:
%           "You defeated %d gyms, and have %d revives remaining. Keep
%           training and one day you will challenge the Elite 4."
%
%       Output string for defeating all 8 gyms:
%           "You defeated 8 gyms, and have %d revives remaining. You may
%            now challenge the Elite 4."
%          
%
% Notes:
%   - The line of code to load the gym leader's stats in your function is:
%
%       load('gymStats.mat')
%
%     This will load the eight variables "stats1", "stats2, "stats3", ...
%     into your function. These are the stats for each gym leader's
%     pokemon, and you cannot code the function without them.
%   - If you are confused about the point of Revives in this problem (the
%     third input), refer to number 2 of the conditions to win a battle.
%
% Hints:
%   - The code to simulate each gym will be very similar, so copy and paste
%     will save you lots of time typing.
%   - Your solution to this problem if you choose to do it should be
%     very long and very repetitive.
%
%
% Test Cases:
%       [conclusion1 finalStats1] = pokemon_MATLABversion([30 20], 'Ground', 1)
%           conclusion1 => 'You defeated 1 gyms, and have 1 revives
%                           remaining. Keep training and you will challenge
%                           the Elite 4 one day.'
%           finalStats1 => [36 30]
%
%       [conclusion2 finalStats2] = pokemon_MATLABversion([91 70], 'Flying', 1)
%           conclusion2 => 'You defeated 8 gyms, and have 0 revives
%                           remaining. You may now challenge the Elite 4.'
%           finalStats2 => [217.2162 196.2162]
%
%       [conclusion3 finalStats3] = pokemon_MATLABversion([100 100], 'Electric', 2)
%           conclusion3 => 'You defeated 7 gyms, and have 2 revives
%                           remaining. Keep training and you will challenge
%                           the Elite 4 one day.'
%           finalStats3 => [201.1817 197.1817]
%   
%       

end

