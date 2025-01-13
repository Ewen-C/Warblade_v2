extends Node2D

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var flash_component: FlashComponent = $FlashComponent

func _ready() -> void:
	scale_component.tween_scale()
	flash_component.flash()
	
	# Remove lasers when it exits the screen
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)

func _process(_delta: float) -> void:
	pass
