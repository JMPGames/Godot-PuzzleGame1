extends Node

var STATS_SAVE_FILE_PATH: String = "user://npstatssave.dat"

var game_mode: int
var difficulty: int
var board_size: int
var stats_data: Dictionary = {}

func set_game_mode(mode: int) -> void:
	game_mode = mode

func set_difficulty(diff: int) -> void:
	difficulty = diff

func set_board_size(size: int) -> void:
	board_size = size

func round_finished(won: bool, time_played: float) -> void:
	var stats: Stats = stats_data[str(game_mode)][str(board_size)][str(difficulty)]
	stats.round_finished(won, time_played)
	save_data()

func get_current_selections_stats() -> Stats:
	return stats_data[str(game_mode)][str(board_size)][str(difficulty)]

#region Saving/Loading Data
func save_data() -> void:
	FileHelper.new().save_data(STATS_SAVE_FILE_PATH, JSON.print(_parse_stats_data()))

func load_data() -> void:
	var stats_data_json: String = FileHelper.new().load_data(STATS_SAVE_FILE_PATH)
	var parsed_data: Dictionary = JSON.parse(stats_data_json).result if stats_data_json else {}
	for game_mode_id in Constants.ALL_GAME_MODE_IDS:
		var game_mode_id_str: String = str(game_mode_id)
		stats_data[game_mode_id_str] = {}		
		for board_size_id in Constants.ALL_BOARD_SIZE_IDS:
			var board_size_id_str: String = str(board_size_id)
			stats_data[game_mode_id_str][board_size_id_str] = {}			
			for difficulty_id in Constants.ALL_DIFFICULTY_IDS:
				var difficulty_id_str: String = str(difficulty_id)
				var stats: Stats = Stats.new()
				if parsed_data:
					stats.load_data(parsed_data[game_mode_id_str][board_size_id_str][difficulty_id_str])
				
				stats_data[game_mode_id_str][board_size_id_str][difficulty_id_str] = stats

func _parse_stats_data() -> Dictionary:
	var response: Dictionary = {}
	for game_mode_id in Constants.ALL_GAME_MODE_IDS:
		var game_mode_id_str: String = str(game_mode_id)
		response[game_mode_id_str] = {}
		for board_size_id in Constants.ALL_BOARD_SIZE_IDS:
			var board_size_id_str: String = str(board_size_id)
			response[game_mode_id_str][board_size_id_str] = {}
			for difficulty_id in Constants.ALL_DIFFICULTY_IDS:
				var difficulty_id_str: String = str(difficulty_id)
				var stats: Stats = stats_data.get(game_mode_id_str, {}).get(board_size_id_str, {}).get(difficulty_id_str, Stats.new())
				response[game_mode_id_str][board_size_id_str][difficulty_id_str] = {
					"rounds_played": stats.get("rounds_played"),
					"rounds_won": stats.get("rounds_won"),
					"rounds_lost": stats.get("rounds_lost"),
					"total_time": stats.get("total_time"),
					"best_time": stats.get("best_time"),
				}
	return response
#endregion
