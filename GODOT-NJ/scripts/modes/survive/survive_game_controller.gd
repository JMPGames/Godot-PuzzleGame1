extends GameController
class_name SurviveGameController

var TILE_LEFT_MOD: float = 0.8
var EASY_GOAL_MOD: float = 0.8
var NORMAL_GOAL_MOD: float = 0.65
var HARD_GOAL_MOD: float = 0.55
var HEALTH_LOST_PER_BOMB: int = -15

var tiles_left_text: RichTextLabel
var max_health: int
var tiles_left: int
var total_numbers: int
var sum_of_numbers: int

func begin(_board_size: Vector2) -> void:
	tiles_left_text = get_node("../UI/UI/TilesLeftText")
	var number_of_tiles: int = int(_board_size.x * _board_size.y)
	var average_number: float = float(sum_of_numbers) / float(total_numbers)
	
	max_health = _get_goal_based_on_difficulty(average_number, number_of_tiles)
	health = max_health
	tiles_left = int(number_of_tiles * TILE_LEFT_MOD)
	tiles_left_text.text = "Tiles Left: %d" % tiles_left	
	.begin(_board_size)

func decrease_tiles_left(amount: int = 1) -> void:
	tiles_left -= amount
	tiles_left_text.text = "Tiles Left: %d" % tiles_left

func adjust_health(amount: int) -> void:
	.adjust_health(amount)
	if state == Globals.GameState.ACTIVE and tiles_left <= 0:
		trigger_game_won()

func pressed_bomb() -> void:
	adjust_health(HEALTH_LOST_PER_BOMB)

func _get_goal_based_on_difficulty(average_number: float, number_of_tiles: int) -> int:
	if DataController.difficulty <= 2:
		return int((average_number * number_of_tiles) * EASY_GOAL_MOD)
	elif DataController.difficulty <= 5:
		return int((average_number * number_of_tiles) * NORMAL_GOAL_MOD)
	else:
		return int((average_number * number_of_tiles) * HARD_GOAL_MOD)
