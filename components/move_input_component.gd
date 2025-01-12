class_name MoveInputComponent
extends Node

@export var move_component: MoveComponent; # Class_name -> type for inspector
@export var move_stats: MoveStats; # Decouples stats from script

func _input(event: InputEvent) -> void:
	var input_axis = Input.get_axis("move_left", "move_right")
	move_component.velocity = Vector2(input_axis * move_stats.speed, 0)
