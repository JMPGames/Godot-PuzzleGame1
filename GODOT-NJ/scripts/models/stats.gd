extends Resource

class_name Stats

var rounds_played: int = 0
var rounds_won: int = 0
var rounds_lost: int = 0
var total_time: float = 0.0
var best_time: float = 0.0

func round_finished(won: bool, time_played: float) -> void:
	rounds_played += 1
	if won:
		rounds_won += 1
	else:
		rounds_lost += 1
	
	total_time += time_played
	if won and (not best_time or time_played < best_time):
		best_time = time_played
