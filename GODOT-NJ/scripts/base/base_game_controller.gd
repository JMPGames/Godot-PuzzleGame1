extends GameController

class_name BaseGameController

var score_text: RichTextLabel
var tiles_pressed_text: RichTextLabel
var allowed_presses_text: RichTextLabel
var goal_text: RichTextLabel
var max_score: int
var goal: int
var allowed_presses: int

func begin() -> void:
	score_text = get_node("../UI/ScoreText")
	allowed_presses_text = get_node("../UI/AllowedPressesText")
	goal_text = get_node("../UI/GoalText")
	tiles_pressed_text = get_node("../UI/TilesPressedText")
	set_score(0)
	set_goal(int(max_score * 0.75))
	
	allowed_presses = int((Constants.BOARD_WIDTH * Constants.BOARD_HEIGHT) * 0.8)
	allowed_presses_text.text = "Allowed Pressed: %d" % allowed_presses
	tiles_pressed_text.text = "Tiles Pressed: 0"
	
	.begin()

func set_score(new_score: int) -> void:
	score = new_score
	score_text.text = "Score: %d" % score	

func increase_max_score(amount: int) -> void:
	max_score += amount

func increase_score(amount: int) -> void:
	score += amount
	score_text.text = "Score: %d" % score
	
	if score >= goal and tiles_pressed <= allowed_presses:
		print("Game Won")
		state = Globals.GameState.PAUSED
	elif tiles_pressed >= allowed_presses and score < goal:
		print("Game Lost")
		state = Globals.GameState.PAUSED

func increase_tiles_pressed(amount: int = 1) -> void:
	tiles_pressed += 1
	tiles_pressed_text.text = "Tiles Pressed: %d" % tiles_pressed

func set_goal(new_goal: int) -> void:
	goal = new_goal
	goal_text.text = "Goal: %d" % goal

