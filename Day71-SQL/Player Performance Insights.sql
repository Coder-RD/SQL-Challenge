select distinct p.player_name, p.score
from Players p
join Matches m
on p.player_name=m.winner
order by p.score desc 
limit 3;