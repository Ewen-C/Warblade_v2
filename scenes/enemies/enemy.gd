extends Node2D

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var move_component: MoveComponent = $MoveComponent as MoveComponent
@onready var stats_component: StatsComponent = $StatsComponent as StatsComponent
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent
@onready var flash_component: FlashComponent = $FlashComponent as FlashComponent
@onready var shake_component: ShakeComponent = $ShakeComponent as ShakeComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent as HitboxComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent as HurtboxComponent
@onready var destroyed_component: DestroyedComponent = $DestroyedComponent
@onready var item_drop_component: ItemDropComponent = $ItemDropComponent
@onready var bullet_timer: Timer = $BulletTimer
@onready var bullet_spawner_component: SpawnerComponent = $BulletSpawnerComponent

func _ready() -> void:
	# Enemy feedback to damage
	hurtbox_component.hurt.connect(func(_hitbox: HitboxComponent):
		scale_component.tween_scale()
		flash_component.flash()
		shake_component.tween_shake()
	)
	
	# Kills enemy when health depleted
	stats_component.no_health.connect(item_drop_component.drop_item)
	hitbox_component.hit_hurtbox.connect(
		destroyed_component.destroy.unbind(1)
	)
	
	# Fire bullet when timer triggers
	bullet_timer.timeout.connect(on_bullet_timeout)
	bullet_timer.wait_time = randf_range(5, 15)
	bullet_timer.start()
	
func on_bullet_timeout():
	print_debug(name + str(get_instance_id()) + " on_bullet_timeout")
	#bullet_spawner_component.spawn()
	bullet_timer.wait_time = randf_range(5, 15)
