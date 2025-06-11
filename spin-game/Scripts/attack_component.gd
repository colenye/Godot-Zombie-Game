extends Area2D

@export var damage = 30



func _on_area_entered(area: Area2D) -> void:
	if area.has_method("damage"):
		var attack = Attack.new()
		attack.attack_damage = damage
		print("attacked")
		area.damage(attack)
