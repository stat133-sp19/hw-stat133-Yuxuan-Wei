## Data `shots-data.csv`,`andre-iguodala.csv`,`draymond-green.csv`,`kevin-durant.csv`,`klay-thompson.csv`,`stephen-curry.csv`

Here's the description of the data variables:

- `team_name`: character,name of the player's team.
- `game_date`: character,date of the game.
- `season`: double,year of the season.
- `period`: double,the period of the an NBA game(an NBA game is divided in 4 periods of 12 mins each, and 1 refers to the first 12 mins of the game).
- `minutes_remaining`: double,the remained amount of minutes to be played in a given period of a game.
- `seconds_remaining`:double,the remained amount of seconds to be played in a given period of a game.
- `shot_made_flag`: factor,indicates whether a shot was made(y) or missed(n).
- `action_type`: character,the basketball moves used by players.
- `shot_type`: factor,indicates weather a shot is a 2-points field goal or a 3-points field goal.
- `shot_distance`: double,the distance of the shot to the basket(measured in feet).
- `opponent`: character,name of the opponent team.
- `x`: double,the x count coordinates(measured in inches) where a shot occurred.
- `y`: double,the y count coordinates(measured in inches) where a shot occurred.

