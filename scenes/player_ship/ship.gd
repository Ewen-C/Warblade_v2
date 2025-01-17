extends Node2D

@onready var left_cannon: Marker2D = $LeftCannon
@onready var right_cannon: Marker2D = $RightCannon
@onready var laser_spawner_component: SpawnerComponent = $LaserSpawnerComponent
@onready var cannon_timer: Timer = $CannonTimer
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent
@onready var ship_animated_sprite: AnimatedSprite2D = $Anchor/ShipAnimatedSprite
@onready var move_component: MoveComponent = $MoveComponent
@onready var move_input_component: MoveInputComponent = $MoveInputComponent

var can_shoot = true
var input_shoot = false
var spawned_laser = null

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
	scale_component.tween_scale()
	
	spawned_laser = laser_spawner_component.spawn(left_cannon.global_position)
	spawned_laser.global_rotation = left_cannon.global_rotation
	spawned_laser.move_component.velocity = Vector2.UP.rotated(left_cannon.global_rotation) * 200

	spawned_laser = laser_spawner_component.spawn(right_cannon.global_position)
	spawned_laser.global_rotation = right_cannon.global_rotation
	spawned_laser.move_component.velocity = Vector2.UP.rotated(right_cannon.global_rotation) * 200

func _on_cannon_timer_timeout() -> void:
	can_shoot = true
	if input_shoot: shoot_lasers()

func animate_ship() -> void:
	if move_component.velocity.x < 0: ship_animated_sprite.play("turn_left")
	elif move_component.velocity.x > 0: ship_animated_sprite.play("turn_right")
	else: ship_animated_sprite.play("center")
	
func apply_item(i_type: Item.item_type, i_amount: float):
	print_debug(Item.item_type.keys()[i_type])
	print_debug(i_amount)
	
	if(i_type == Item.item_type.CANNON_ANGLE) :
		var cannon_l = clampf(left_cannon.global_rotation_degrees - i_amount, -20, 20)
		left_cannon.global_rotation_degrees = cannon_l
		
		var cannon_r = clampf(right_cannon.global_rotation_degrees + i_amount, -20, 20)
		right_cannon.global_rotation_degrees = cannon_r
	
	elif(i_type == Item.item_type.FIRE_RATE) :
		var fire_r = max(cannon_timer.wait_time - i_amount, 0.1)
		cannon_timer.wait_time = fire_r
	
	elif(i_type == Item.item_type.MOVE_SPEED) :
		move_input_component.move_stats.speed += i_amount
