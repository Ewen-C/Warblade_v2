class_name ItemDropComponent
extends Node2D

@export var item_spawner_component: SpawnerComponent

# Dictionary of item scenes -> probabilities

func drop_item() -> void:
	var drop_percent = randf_range(0, 100)
	
	if(drop_percent <= 15): item_spawner_component.spawn()
	drop_percent -= 15
