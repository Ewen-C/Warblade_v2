class_name LevelManager
extends Node2D

@export var level_list: Array[PackedScene] = []

@onready var level_spawner_component: SpawnerComponent = $LevelSpawnerComponent
@onready var level_delay_timer: Timer = $LevelDelayTimer

var current_level_index: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_debug("level_manager _ready")
	
	if(level_list.size() == 0): print_debug("Level array if empty")
	else: level_delay_timer.start()

func _on_level_delay_timer_timeout() -> void:
	spawn_level()

func spawn_level() -> void:
	print_debug("Spawn_level")
	level_spawner_component.scene = level_list[current_level_index]
	level_spawner_component.spawn()
