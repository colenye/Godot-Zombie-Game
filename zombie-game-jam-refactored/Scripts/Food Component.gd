extends Node

@export var hotbar: Inventory
@export var healthComponent: HealthComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("use item") and hotbar.equippedItem is FoodItem:
		eat()
		print(healthComponent.health)
func eat():
	if healthComponent:
		healthComponent.addHealth(hotbar.equippedItem.healAmount)
