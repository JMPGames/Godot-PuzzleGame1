extends GameController

class_name SurviveGameController

var tiles_left_text: RichTextLabel
var max_health: int
var tiles_left: int
var total_numbers: int
var sum_of_numbers: int

func begin(_board_size: Vector2) -> void:
	tiles_left_text = get_node("../UI/UI/TilesLeftText")
	var number_of_tiles := _board_size.x * _board_size.y
	var average_number := sum_of_numbers / total_numbers
	
	max_health = int((average_number * number_of_tiles) * 0.6)
	health = max_health
	tiles_left = int(number_of_tiles * 0.8)
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
	adjust_health(-(max_health * 0.2))
