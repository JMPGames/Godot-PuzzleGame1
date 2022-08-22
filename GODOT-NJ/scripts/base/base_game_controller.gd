extends GameController

class_name BaseGameController

var max_score_text: RichTextLabel
var goal_text: RichTextLabel
var max_score: int
var goal: int
var allowed_presses: int

func begin() -> void:
	max_score_text = get_node("../UI/MaxScoreText")
	goal_text = get_node("../UI/GoalText")
	set_goal(int(max_score * 0.75))
	allowed_presses = int((Constants.BOARD_WIDTH * Constants.BOARD_HEIGHT) * 0.8)
	
	max_score_text.text = "Max Score: %d" % max_score
	.begin()

func increase_max_score(amount: int) -> void:
	max_score += amount

func increase_score(amount: int) -> void:
	.increase_score(amount)
	print("Pressed: %d  Allowed: %d" % [tiles_pressed, allowed_presses])
	print("Score: %d  Goal: %d" % [score, goal])
	if score >= goal and tiles_pressed <= allowed_presses:
		print("Game Won")
		state = Globals.GameState.PAUSED
	elif tiles_pressed >= allowed_presses and score < goal:
		print("Game Lost")
		state = Globals.GameState.PAUSED
	
func set_goal(new_goal: int) -> void:
	goal = new_goal
	goal_text.text = "Goal: %d" % goal

