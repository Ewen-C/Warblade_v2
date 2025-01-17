class_name ItemPickupComponent
extends Area2D

@export var ship: Node2D
@export var stats_component: StatsComponent

# Create a signal for when the hitbox hits a hurtbox
signal pickup_item()

func _ready():
	# Connect _on_item_contact to pickup entered function
	area_entered.connect(_on_item_contact)

func _on_item_contact(item_pickup: Item_Area):
	if not item_pickup is Item_Area: return
	
	ship.apply_item(item_pickup.item.type, item_pickup.item.amount)
	item_pickup.item.queue_free()
