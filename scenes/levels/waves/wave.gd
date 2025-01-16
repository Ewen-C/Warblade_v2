class_name Wave
extends Node2D

@onready var enemy_spawn_interval_timer: Timer = $EnemySpawnIntervalTimer
@onready var enemy_path_2d: Path2D = $EnemyPath2D
@onready var enemy_spawner_component: SpawnerComponent = $EnemySpawnerComponent

@export var enemies_to_spawn: int
var enemies_count: int = 0

func start_wave() -> void:
	print_debug("Start wave")
	spawn_enemy()
	enemy_spawn_interval_timer.start()

func _on_enemy_spawn_interval_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy() -> void:
	# Create Enemy on new PathFollowComponent inside the wave path
	var path_follower = PathFollowComponent.new()
	enemy_path_2d.add_child(path_follower)
	var enemy = enemy_spawner_component.spawn(path_follower.global_position, path_follower)

	enemies_to_spawn -= 1;
	if(enemies_to_spawn == 0): enemy_spawn_interval_timer.stop()

	enemies_count += 1
	enemy.stats_component.no_health.connect(decrement_enemies_count)

func decrement_enemies_count() -> void:
	enemies_count -= 1
	
	if enemies_to_spawn == 0 and enemies_count == 0 : 
		wave_cleared.emit()
		queue_free()

signal wave_cleared() # Emit when there is no enemies left
