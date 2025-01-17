class_name ItemDropComponent
extends Node2D

@export var item_spawner_component: SpawnerComponent
@export var spawnable_items: Array[PackedScene]

# TODO : Dictionary of item scenes -> probabilities

func drop_item() -> void:
	if spawnable_items.size() == 0: print_debug("No items to drop !")
	var drop_percent = randf_range(0, 100)
	
	for spawnable_item in spawnable_items:
		if(drop_percent <= 10):
			item_spawner_component.scene = spawnable_item
			item_spawner_component.spawn()
			print_debug("Drop !")
			return
		drop_percent -= 10
