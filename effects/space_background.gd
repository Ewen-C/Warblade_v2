extends ParallaxBackground

@onready var space_layer: ParallaxLayer = %SpaceLayer
@onready var stars_far_layer: ParallaxLayer = %StarsFarLayer
@onready var stars_close_layer: ParallaxLayer = %StarsCloseLayer

func _process(delta: float) -> void:
	space_layer.motion_offset.y += 2.5 * delta
	stars_far_layer.motion_offset.y += 9 * delta
	stars_close_layer.motion_offset.y += 20 * delta
	pass
