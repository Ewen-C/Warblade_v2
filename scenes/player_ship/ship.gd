extends Node2D

@onready var left_cannon: Marker2D = $LeftCannon
@onready var right_cannon: Marker2D = $RightCannon
@onready var laser_spawner_component: SpawnerComponent = $LaserSpawnerComponent
@onready var cannon_timer: Timer = $CannonTimer
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent
@onready var ship_animated_sprite: AnimatedSprite2D = $Anchor/ShipAnimatedSprite
@onready var move_component: MoveComponent = $MoveComponent

var can_shoot = true
var input_shoot = false

func _process(_delta: float) -> void:
	animate_ship()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"): 
		input_shoot = true
		shoot_lasers()
	elif event.is_action_released("shoot"): 
		input_shoot = false
	
func shoot_lasers() -> void:
	if not can_shoot: return
	can_shoot = false
	cannon_timer.start()
	
	laser_spawner_component.spawn(left_cannon.global_position)
	laser_spawner_component.spawn(right_cannon.global_position)
	scale_component.tween_scale()

func _on_cannon_timer_timeout() -> void:
	can_shoot = true
	if input_shoot: shoot_lasers()

func animate_ship() -> void:
	if move_component.velocity.x < 0: ship_animated_sprite.play("turn_left")
	elif move_component.velocity.x > 0: ship_animated_sprite.play("turn_right")
	else: ship_animated_sprite.play("center")
