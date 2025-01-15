class_name Wave
extends Node2D

@onready var enemy_spawn_interval_timer: Timer = $EnemySpawnIntervalTimer
@onready var enemy_path_2d: Path2D = $EnemyPath2D
@onready var enemy_spawner_component: SpawnerComponent = $EnemySpawnerComponent

@export var enemies_to_spawn: int

func start_wave() -> void:
	spawn_enemy()
	enemy_spawn_interval_timer.start()

func _on_enemy_spawn_interval_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy() -> void:
	# Create Enemy on new PathFollow2D inside the wave path
	var path_follow_2d = PathFollow2D.new()
	enemy_path_2d.add_child(path_follow_2d)
	var enemy = enemy_spawner_component.spawn(path_follow_2d.global_position, path_follow_2d)
	

	enemies_to_spawn -= 1;
	if(enemies_to_spawn == 0): enemy_spawn_interval_timer.stop()

# TODO : Remove wave when it spawned its enemies, without removing said enemies
