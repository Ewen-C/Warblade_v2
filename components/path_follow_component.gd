class_name PathFollowComponent
extends PathFollow2D

@export var move_speed: float = 0.2

var ismoving = true

func _ready() -> void:
	loop = false
	rotates = false
	rotation = 0

func _process(delta: float) -> void:
	if not ismoving : return
	
	progress_ratio += clamp(delta * move_speed, 0, 1)
	if progress_ratio == 1 : ismoving = false
