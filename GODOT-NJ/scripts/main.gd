extends Node

class_name Main

onready var game_controller: GameController = $GameController
onready var board_controller: BoardController = $BoardController
onready var menu_controller: PauseMenuController = $MenuController
var player: Node
var camera: Node
var selected_board_size: Vector2 = Vector2(8, 8)

func _ready():
	_setup_board_and_camera()
	board_controller.build_board(game_controller, selected_board_size)
	_place_player()
	menu_controller.initialize(game_controller)
	game_controller.begin(selected_board_size)

func _place_player() -> void:
	var rng := RandomNumberGenerator.new()
	rng.randomize()
	player = get_node("Player")
	player.place_entity(
		rng.randi_range(0, selected_board_size.x - 1),
		rng.randi_range(0, selected_board_size.y - 1)
	)
	player.initialize(game_controller, board_controller)

func _setup_board_and_camera() -> void:
	camera = get_node("Camera2D")
	match DataController.board_size:
		0:
			camera.zoom = Vector2(0.5, 0.5)
			camera.position = Vector2(100, 115)
			selected_board_size = Vector2(8, 8)
		1:
			camera.zoom = Vector2(0.5, 0.5)
			camera.position = Vector2(225, 115)
			selected_board_size = Vector2(16, 8)
		2:
			camera.zoom = Vector2(0.7, 0.7)
			camera.position = Vector2(225, 180)
			selected_board_size = Vector2(16, 12)
		3:
			camera.zoom = Vector2(0.72, 0.72)
			camera.position = Vector2(345, 180)
			selected_board_size = Vector2(24, 12)
		_:
			camera.zoom = Vector2(0.5, 0.5)
			camera.position = Vector2(100, 100)
			selected_board_size = Vector2(8, 8)
