extends Node2D

@onready var left_cannon: Marker2D = $LeftCannon
@onready var right_cannon: Marker2D = $RightCannon
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var cannon_timer: Timer = $CannonTimer
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent

var can_fire = false

func _ready() -> void:
	cannon_timer.timeout.connect(fire_lasers)

func fire_lasers() -> void:
	spawner_component.spawn(left_cannon.global_position)
	spawner_component.spawn(right_cannon.global_position)
	scale_component.tween_scale()
	
	#Input.is_action_pressed("shoot")
