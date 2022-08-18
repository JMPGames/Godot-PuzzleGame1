extends Area2D

class_name Tile

export(Constants.TileType) var tile_type
onready var left_display: Sprite = get_node("LeftDisplay")
onready var mid_display: Sprite = get_node("MidDisplay")
onready var right_display: Sprite = get_node("RightDisplay")
var blocked: bool
var numbers: Array = []
var current_number: int

func activate():
	print("tile.activate")

func _ready():
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.randomize()
	
	current_number = 1
	left_display.set_texture(_get_number(rng.randi_range(0, 9)))
	mid_display.set_texture(_get_number(rng.randi_range(0, 9)))
	right_display.set_texture(_get_number(rng.randi_range(0, 9)))

func _get_number(var r: int):
	numbers.append(r)
	if r == 0:
		return Constants.art_num_0
	elif r == 1:
		return Constants.art_num_1
	elif r == 2:
		return Constants.art_num_2
	elif r == 3:
		return Constants.art_num_3
	elif r == 4:
		return Constants.art_num_4
	elif r == 5:
		return Constants.art_num_5
	elif r == 6:
		return Constants.art_num_6
	elif r == 7:
		return Constants.art_num_7
	elif r == 8:
		return Constants.art_num_8
	else:
		return Constants.art_num_9
