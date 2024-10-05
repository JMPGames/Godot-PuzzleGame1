extends GameController
class_name BaseGameController

var EASY_GOAL_MOD: float = 0.5
var NORMAL_GOAL_MOD: float = 0.65
var HARD_GOAL_MOD: float = 0.75

var score_text: RichTextLabel
var tiles_pressed_text: RichTextLabel
var allowed_presses_text: RichTextLabel
var goal_text: RichTextLabel
var max_score: int
var goal: int
var allowed_presses: int

func begin(_board_size: Vector2) -> void:
	score_text = get_node("../UI/UI/ScoreText")
	allowed_presses_text = get_node("../UI/UI/AllowedPressesText")
	goal_text = get_node("../UI/UI/GoalText")
	tiles_pressed_text = get_node("../UI/UI/TilesPressedText")
	set_score(0)
	set_goal(_get_goal_based_on_difficulty())
	
	allowed_presses = int((_board_size.x * _board_size.y) * 0.8)
	allowed_presses_text.text = "Allowed Presses: %d" % allowed_presses
	tiles_pressed_text.text = "Tiles Pressed: 0"	
	.begin(_board_size)

func set_score(new_score: int) -> void:
	score = new_score
	score_text.text = "Score: %d" % score	

func increase_max_score(amount: int) -> void:
	max_score += amount

func increase_score(amount: int) -> void:
	score += amount
	score_text.text = "Score: %d" % score
	if score >= goal and tiles_pressed <= allowed_presses:
		trigger_game_won()
	elif tiles_pressed >= allowed_presses and score < goal:
		trigger_game_lost()

func increase_tiles_pressed(amount: int = 1) -> void:
	tiles_pressed += amount
	tiles_pressed_text.text = "Tiles Pressed: %d" % tiles_pressed

func set_goal(new_goal: int) -> void:
	goal = new_goal
	goal_text.text = "Goal: %d" % goal

func _get_goal_based_on_difficulty() -> int:
	if Constants.EASY_GOAL_DIFFICULTIES.has(DataController.difficulty):
		return int(max_score * EASY_GOAL_MOD)
	elif Constants.NORMAL_GOAL_DIFFICULTIES.has(DataController.difficulty):
		return int(max_score * NORMAL_GOAL_MOD)
	else:
		return int(max_score * HARD_GOAL_MOD)
