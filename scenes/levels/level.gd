extends Node2D

@onready var spawner_component: SpawnerComponent = $SpawnerComponent
@onready var start_delay_timer: Timer = $StartDelayTimer
@onready var enemy_spawn_timer: Timer = $EnemySpawnTimer
@onready var path_2d: Path2D = $Path2D

var enemies_to_spawn = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_delay_timer_timeout() -> void:
	pass # Replace with function body.
