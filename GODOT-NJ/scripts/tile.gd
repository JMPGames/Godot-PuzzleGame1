extends Entity

class_name Tile

var state = Globals.TileState.OPEN
var rng: RandomNumberGenerator
var numbers: Array
var special_display_placed: bool

func activate() -> void:
	push_error("NotImplementedError")

func _ready() -> void:
	game_controller = get_node("../../GameController")
	rng = RandomNumberGenerator.new()
	rng.randomize()

func _adjust_state() -> void:
	match state:
		Globals.TileState.OPEN:
			$Tile.modulate = Color(0, 1, 1)
			$LeftDisplay.modulate = Color(1, 1, 1)
			$MidDisplay.modulate = Color(1, 1, 1)
			$RightDisplay.modulate = Color(1, 1, 1)
			state = Globals.TileState.PRESSED
		Globals.TileState.PRESSED:
			$Tile.modulate = Color(1, 0, 0)
			state = Globals.TileState.BLOCKED

func _update_displays(left: int, mid: int, right: int) -> void:
	$LeftDisplay.set_texture(_get_texture(left))
	$MidDisplay.set_texture(_get_texture(mid))
	$RightDisplay.set_texture(_get_texture(right))

func _get_texture(var number: int):
	numbers.append(number)
	
	if number == 0:
		return Globals.art_num_0
	elif number == 1:
		return Globals.art_num_1
	elif number == 2:
		return Globals.art_num_2
	elif number == 3:
		return Globals.art_num_3
	elif number == 4:
		return Globals.art_num_4
	elif number == 5:
		return Globals.art_num_5
	elif number == 6:
		return Globals.art_num_6
	elif number == 7:
		return Globals.art_num_7
	elif number == 8:
		return Globals.art_num_8
	elif number == 9:
		return Globals.art_num_9
	elif number == Constants.BOMB_INDEX:
		return Globals.art_bomb

func _get_number(var r: int) -> int:
	push_error("NotImplementedError")
	return -1
