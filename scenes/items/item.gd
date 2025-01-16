class_name Item
extends Node2D

@onready var move_component: MoveComponent = $MoveComponent

enum item_type { CANNON_ANGLE, FIRE_RATE, MOVE_SPEED }

@export var type: item_type = item_type.CANNON_ANGLE
@export var amount: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_component.velocity.y = randf_range(25, 100)
