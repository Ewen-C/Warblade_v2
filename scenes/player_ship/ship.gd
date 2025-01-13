extends Node2D

@onready var left_cannon: Marker2D = $LeftCannon
@onready var right_cannon: Marker2D = $RightCannon
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var cannon_timer: Timer = $CannonTimer
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent

var can_shoot = true
var input_shoot = false

func _input(event):
	if event.is_action_pressed("shoot"): 
		input_shoot = true
		shoot_lasers()
	elif event.is_action_released("shoot"): 
		input_shoot = false
	
func shoot_lasers() -> void:
	if not can_shoot: return
	can_shoot = false
	cannon_timer.start()
	
	spawner_component.spawn(left_cannon.global_position)
	spawner_component.spawn(right_cannon.global_position)
	scale_component.tween_scale()

func _on_cannon_timer_timeout() -> void:
	can_shoot = true
	if input_shoot: shoot_lasers()
