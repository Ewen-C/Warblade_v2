class_name Level
extends Node2D

@export var waves_to_spawn: Array[Wave]

func _ready() -> void:
	for wave in waves_to_spawn:
		wave.start_wave()
