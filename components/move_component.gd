class_name MoveComponent # Add a new node to Godot !
extends Node

@export var actor: Node2D
@export var velocity: Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	actor.translate(velocity * delta)
