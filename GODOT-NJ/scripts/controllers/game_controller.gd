extends Node
class_name GameController

export(int) var health

var timer_text: RichTextLabel
var health_text: RichTextLabel
var state = Globals.GameState.PAUSED
var game_timer: float
var score: int
var tiles_pressed: int

func _process(delta: float) -> void:
	if state == Globals.GameState.ACTIVE:
		_update_game_timer(delta)

func begin(_board_size: Vector2) -> void:
	timer_text = get_node("../UI/UI/TimerText")
	health_text = get_node("../UI/UI/HealthText")
	
	state = Globals.GameState.ACTIVE
	health_text.text = "Health: %d" % health

func adjust_health(amount: int) -> void:
	health += amount
	health_text.text = "Health: %d" % health
	if health <= 0:
		trigger_game_lost()

func trigger_game_won() -> void:
	print("Game Won")
	DataController.round_finished(true, game_timer)
	state = Globals.GameState.GAME_OVER

func trigger_game_lost() -> void:
	print("Game Lost")
	DataController.round_finished(false, game_timer)
	state = Globals.GameState.GAME_OVER

func _update_game_timer(delta: float) -> void:
	game_timer += delta
	var milliseconds: float = fmod(game_timer, 1) * 1000
	var seconds: float = fmod(game_timer, 60)
	var minutes: float = fmod(game_timer, 60 * 60) / 60
	var hours: float = fmod(fmod(game_timer, 3600 * 60) / 3600, 24)	
	timer_text.text = "%02d:%02d:%02d:%02d" % [hours, minutes, seconds, milliseconds]
