class_name Level
extends Node2D

@export var waves_to_spawn: Array[Wave]

var waves_cleared: int = 0

func _ready() -> void:
	if waves_to_spawn.size() == 0: print_debug("Level has no waves !")
	for wave in waves_to_spawn:
		wave.start_wave()
		wave.wave_cleared.connect(increment_waves_cleared)

func increment_waves_cleared():
	print_debug("Level increment_waves_cleared")
	waves_cleared += 1
	if waves_cleared == waves_to_spawn.size() : 
		level_cleared.emit()
		queue_free()

signal level_cleared() # Emit when there is no enemies left
