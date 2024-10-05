extends Node
class_name Main

var PLAYER_NODE_NAME: String = "Player"
var CAMERA_NODE_NAME: String = "Camera2D"
var CAMERA_ZOOM_ONE: Vector2 = Vector2(0.5, 0.5)
var CAMERA_ZOOM_TWO: Vector2 = Vector2(0.7, 0.7)
var CAMERA_ZOOM_THREE: Vector2 = Vector2(0.72, 0.72)
var CAMERA_POSITION_ONE: Vector2 = Vector2(100, 115)
var CAMERA_POSITION_TWO: Vector2 = Vector2(225, 115)
var CAMERA_POSITION_THREE: Vector2 = Vector2(225, 180)
var CAMERA_POSITION_FOUR: Vector2 = Vector2(345, 180)
var SMALL_BOARD: Vector2 = Vector2(8, 8)
var MEDIUM_BOARD: Vector2 = Vector2(16, 8)
var LARGE_BOARD: Vector2 = Vector2(16, 12)
var XLARGE_BOARD: Vector2 = Vector2(24, 12)

onready var game_controller: GameController = $GameController
onready var board_controller: BoardController = $BoardController
onready var menu_controller: PauseMenuController = $MenuController
var player: Node
var camera: Node
var selected_board_size: Vector2 = SMALL_BOARD

func _ready():
	_setup_board_and_camera()
	board_controller.build_board(game_controller, selected_board_size)
	_place_player()
	menu_controller.initialize(game_controller)
	game_controller.begin(selected_board_size)

func _place_player() -> void:
	var rng := RandomNumberGenerator.new()
	rng.randomize()
	player = get_node(PLAYER_NODE_NAME)
	player.place_entity(
		rng.randi_range(0, selected_board_size.x - 1), # warning-ignore:narrowing_conversion
		rng.randi_range(0, selected_board_size.y - 1) # warning-ignore:narrowing_conversion
	)
	player.initialize(game_controller, board_controller)

func _setup_board_and_camera() -> void:
	camera = get_node(CAMERA_NODE_NAME)
	match DataController.board_size:
		0:
			camera.zoom = CAMERA_ZOOM_ONE
			camera.position = CAMERA_POSITION_ONE
			selected_board_size = SMALL_BOARD
		1:
			camera.zoom = CAMERA_ZOOM_ONE
			camera.position = CAMERA_POSITION_TWO
			selected_board_size = MEDIUM_BOARD
		2:
			camera.zoom = CAMERA_ZOOM_TWO
			camera.position = CAMERA_POSITION_THREE
			selected_board_size = LARGE_BOARD
		3:
			camera.zoom = CAMERA_ZOOM_THREE
			camera.position = CAMERA_POSITION_FOUR
			selected_board_size = XLARGE_BOARD
		_:
			camera.zoom = CAMERA_ZOOM_ONE
			camera.position = CAMERA_POSITION_ONE
			selected_board_size = SMALL_BOARD
