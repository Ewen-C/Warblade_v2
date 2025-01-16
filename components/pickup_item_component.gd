class_name PickupItemComponent
extends Area2D

@export var ship: Node2D
@export var stats_component: StatsComponent

# Create a signal for when the hitbox hits a hurtbox
signal pickup_item()

func _ready():
	# Connect _on_item_contact to pickup entered function
	print_debug("Pick item ready")
	area_entered.connect(_on_item_contact)

func _on_item_contact(item_pickup: Item_Area):
	print_debug("_on_item_contact")
	
	if not item_pickup is Item_Area: return
	item_pickup.queue_free()
