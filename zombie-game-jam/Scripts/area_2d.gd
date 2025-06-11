extends Area2D

@onready var player = $".."
@onready var weapons = $"../Weapons"
@onready var pistolAmmoPickup = $pistolAmmoPickup
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("pistolAmmo"):
		for c in weapons.get_children():
			if c.name == "Pistol":
				c.set_meta("totalAmount", c.get_meta("totalAmount") + 20)
				pistolAmmoPickup.play()
				$"../UI/HBoxContainer/right/maxAmmo".value = c.get_meta("totalAmount")
				area.queue_free()
	if area.is_in_group("rocketAmmo"):
		
		for c in weapons.get_children():
			if c.name == "Rocket":
				c.set_meta("totalAmount", c.get_meta("totalAmount") + 20)
				$"../UI/HBoxContainer/right/maxAmmo".value = c.get_meta("totalAmount")
				area.queue_free()
				
		area.queue_free()
