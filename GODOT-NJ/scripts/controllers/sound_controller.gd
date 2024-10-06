extends Node
class_name SoundController

onready var move_audio = $MoveAudio
onready var ui_positive_audio = $UIPositiveAudio
onready var ui_negative_audio = $UINegativeAudio

func play_move_audio() -> void:
	move_audio.playing = true

func play_ui_positive_audio() -> void:
	ui_positive_audio.playing = true

func play_ui_negative_audio() -> void:
	ui_negative_audio.playing = true