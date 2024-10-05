extends Panel

class_name MainMenuStatsPanelController

onready var selected_mode_text = $SelectedModeText
onready var best_time_text = $BestTimeText
onready var average_time_text = $AverageTimeText
onready var win_percentage_text = $WinPercentageText
onready var games_won_text = $GamesWonText
onready var games_played_text = $GamesPlayedText

func setup() -> void:
	var game_mode: String = Constants.GAME_MODES[DataController.game_mode]
	var difficulty: String = Constants.DIFFICULTIES[DataController.difficulty]
	var board_size: String = Constants.BOARD_SIZES[DataController.board_size]
	var stats := DataController.get_current_selections_stats()
	
	var average_time: float = 0.0
	var win_percentage: float = 0
	if stats.rounds_played > 0:
		average_time = stats.total_time / stats.rounds_played
		win_percentage = (float(stats.rounds_won) / float(stats.rounds_played)) * 100
		
	selected_mode_text.text = "%s - %s - %s" % [game_mode, board_size, difficulty]
	best_time_text.text = str(stepify(stats.best_time, 0.01))
	average_time_text.text = str(stepify(average_time, 0.01))
	win_percentage_text.text = "{per}%".format({"per": str(win_percentage)})
	games_won_text.text = str(stats.rounds_won)
	games_played_text.text = str(stats.rounds_played)
