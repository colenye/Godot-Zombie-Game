extends Node
class_name PlayerInventoryComponent
@export var playerHotbar: Inventory
@export var sprite : Node2D # Strictly only referenced because this flips, and all its children will flip 
@onready var items: Array = playerHotbar.items

var currentWeaponScene: Node2D = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _unhandled_input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		var unicode := OS.get_keycode_string(event.keycode)
		if unicode.is_valid_int():
			equip(unicode.to_int())
		
func equip(inventoryIndex: int):
	if inventoryIndex < 0 or inventoryIndex >= items.size() or items[inventoryIndex] is not InventoryItem:
		return  # Out of bounds
	
	if currentWeaponScene:
		currentWeaponScene.queue_free()
	
	var currentWeaponPackedScene = items[inventoryIndex].scene
	playerHotbar.equippedItem = items[inventoryIndex]
	if !currentWeaponPackedScene:
		print("No scene found")
		return
	var weapon = currentWeaponPackedScene.instantiate()
	weapon.global_position.x -= 5
	weapon.global_position.x += 3
	sprite.add_child(weapon)
	currentWeaponScene = weapon

func _process(delta: float) -> void:
	if currentWeaponScene:
		currentWeaponScene.look_at(get_viewport().get_mouse_position())
		currentWeaponScene.rotation_degrees += 180
