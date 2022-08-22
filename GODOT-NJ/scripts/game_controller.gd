extends Node

class_name GameController

export(int) var health
var score_text: RichTextLabel
var timer_text: RichTextLabel
var health_text: RichTextLabel
var tiles_pressed_text: RichTextLabel
var state = Globals.GameState.PAUSED
var game_timer: float
var score: int
var tiles_pressed: int

func _process(delta: float) -> void:
	if state == Globals.GameState.ACTIVE:
		_update_game_timer(delta)

func begin() -> void:
	score_text = get_node("../UI/ScoreText")
	timer_text = get_node("../UI/TimerText")
	health_text = get_node("../UI/HealthText")
	tiles_pressed_text = get_node("../UI/TilesPressedText")
	
	state = Globals.GameState.ACTIVE
	set_score(0)
	health_text.text = "Health: %d" % health
	tiles_pressed_text.text = "Tiles Pressed: 0"

func set_score(new_score: int) -> void:
	score = new_score
	score_text.text = "Score: %d" % score

func increase_score(amount: int) -> void:
	score += amount
	score_text.text = "Score: %d" % score

func adjust_health(amount: int) -> void:
	health += amount
	health_text.text = "Health: %d" % health

func increase_tiles_pressed(amount: int = 1) -> void:
	tiles_pressed += 1
	tiles_pressed_text.text = "Tiles Pressed: %d" % tiles_pressed

func _update_game_timer(delta: float) -> void:
	game_timer += delta

	var milliseconds := fmod(game_timer, 1) * 1000
	var seconds := fmod(game_timer, 60)
	var minutes := fmod(game_timer, 60 * 60) / 60
	var hours := fmod(fmod(game_timer, 3600 * 60) / 3600, 24)
	
	timer_text.text = "%02d:%02d:%02d:%02d" % [hours, minutes, seconds, milliseconds]
