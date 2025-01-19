class_name Item
extends Node2D

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var move_component: MoveComponent = $MoveComponent

enum item_type { CANNON_ANGLE, FIRE_RATE, MOVE_SPEED }

@export var type: item_type = item_type.CANNON_ANGLE
@export var amount: float = 0

func _ready() -> void:
	move_component.velocity.y = randf_range(25, 100) # Item fall
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
