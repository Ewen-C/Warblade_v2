extends Node2D

@onready var start_delay_timer: Timer = $StartDelayTimer

@export var waves_to_spawn: Array[Wave]

func _on_start_delay_timer_timeout() -> void:
	for wave in waves_to_spawn:
		wave.start_wave()
