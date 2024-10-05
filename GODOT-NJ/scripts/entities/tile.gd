extends Entity
class_name Tile

var state = Globals.TileState.OPEN
var rng: RandomNumberGenerator
var numbers: Array
var special_display_placed: bool

func activate() -> void:
	push_error("NotImplementedError")

func _ready() -> void:
	rng = RandomNumberGenerator.new()
	rng.randomize()

func _adjust_state() -> void:
	match state:
		Globals.TileState.OPEN:
			$LeftDisplay.modulate = Color(1, 1, 1)
			$MidDisplay.modulate = Color(1, 1, 1)
			$RightDisplay.modulate = Color(1, 1, 1)
			if Constants.HARD_TILE_LOCKING_DIFFICULTIES.has(DataController.difficulty):
				_set_to_blocked_state()
			else:
				$Tile.modulate = Color(0, 1, 1)
				state = Globals.TileState.PRESSED
		Globals.TileState.PRESSED:
			if not Constants.NO_TILE_LOCKING_DIFFICULTIES.has(DataController.difficulty):
				_set_to_blocked_state()

func _set_to_blocked_state() -> void:
	$Tile.modulate = Color(1, 0, 0)
	state = Globals.TileState.BLOCKED

func _update_displays(left: int, mid: int, right: int) -> void:
	$LeftDisplay.set_texture(_get_texture(left))
	$MidDisplay.set_texture(_get_texture(mid))
	$RightDisplay.set_texture(_get_texture(right))

func _get_texture(number: int):
	numbers.append(number)
	match number:
		0:
			return Globals.art_num_0
		1:
			return Globals.art_num_1
		2:
			return Globals.art_num_2
		3:
			return Globals.art_num_3
		4:
			return Globals.art_num_4
		5:
			return Globals.art_num_5
		6:
			return Globals.art_num_6
		7:
			return Globals.art_num_7
		8:
			return Globals.art_num_8
		9:
			return Globals.art_num_9
		Constants.BOMB_INDEX:
			return Globals.art_bomb

func _get_number(r: int = -1) -> int:
	push_error("NotImplementedError")
	return r
