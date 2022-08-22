extends Node


onready var base_tile_object: PackedScene = preload("res://prefabs/BaseGameTile.tscn")
onready var survive_tile_object: PackedScene = preload("res://prefabs/SurviveGameTile.tscn")
onready var art_num_0 = preload("res://art/ui_num0.png")
onready var art_num_1 = preload("res://art/ui_num1.png")
onready var art_num_2 = preload("res://art/ui_num2.png")
onready var art_num_3 = preload("res://art/ui_num3.png")
onready var art_num_4 = preload("res://art/ui_num4.png")
onready var art_num_5 = preload("res://art/ui_num5.png")
onready var art_num_6 = preload("res://art/ui_num6.png")
onready var art_num_7 = preload("res://art/ui_num7.png")
onready var art_num_8 = preload("res://art/ui_num8.png")
onready var art_num_9 = preload("res://art/ui_num9.png")
onready var art_bomb = preload("res://art/tile_bomb.png")

enum GameState {PAUSED, ACTIVE}
enum TileState {OPEN, PRESSED, BLOCKED}
