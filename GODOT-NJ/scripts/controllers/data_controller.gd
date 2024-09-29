extends Node

var game_mode: int
var difficulty: int
var board_size: int
var stats_data: Dictionary = {}

func load_data() -> void:
	# TODO:: Attempt to load data
	# if no data found:
	if not stats_data:
		stats_data = _build_starting_data()

func round_finished(won: bool, time_played: float) -> void:
	var stats: Stats = stats_data[game_mode][board_size][difficulty]
	stats.round_finished(won, time_played)

func set_game_mode(mode: int) -> void:
	game_mode = mode

func set_difficulty(diff: int) -> void:
	difficulty = diff

func set_board_size(size: int) -> void:
	board_size = size

func get_current_selections_stats() -> Stats:
	return stats_data[game_mode][board_size][difficulty]

func _build_starting_data() -> Dictionary:
	var response: Dictionary = {}
	for game_mode_id in Constants.ALL_GAME_MODE_IDS:
		response[game_mode_id] = {}
		for board_size_id in Constants.ALL_GAME_MODE_IDS:
			response[game_mode_id][board_size_id] = {}
			for difficulty_id in Constants.ALL_DIFFICULTY_IDS:
				response[game_mode_id][board_size_id][difficulty_id] = Stats.new()
		
	return response
