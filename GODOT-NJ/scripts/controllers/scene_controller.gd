extends Node

var game_mode: int
var difficulty: int
var board_size: int

func set_game_mode(mode: int) -> void:
	game_mode = mode

func set_difficulty(diff: int) -> void:
	difficulty = diff

func set_board_size(size: int) -> void:
	board_size = size
