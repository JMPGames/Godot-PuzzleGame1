extends Node

class_name Main

var BASE_BOARD_SIZE: int = 8

onready var game_controller: GameController = $GameController
onready var board_controller: BoardController = $BoardController
var player: Node
var selected_board_size: int = 8

func _ready():
	selected_board_size = BASE_BOARD_SIZE * (SceneController.board_size + 1)
	board_controller.build_board(game_controller, selected_board_size)
	_place_player()
	game_controller.begin(selected_board_size)

func _place_player() -> void:
	var rng := RandomNumberGenerator.new()
	rng.randomize()
	player = get_node("Player")
	player.place_entity(
		rng.randi_range(0, selected_board_size - 1),
		rng.randi_range(0, selected_board_size - 1)
	)
	player.initialize(game_controller, board_controller)
