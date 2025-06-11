extends Area2D


func kill(area, area_shape_index : int, DAMAGE: float, death : String = "death1", rocket : bool = false):
	if area.is_in_group("Zombie"):

		var zomHealth = area.get_parent().health
		if area_shape_index == 0:
			area.get_parent().health -= DAMAGE
		elif area_shape_index == 1:
			area.get_parent().health -= DAMAGE/5
		
		if area.get_parent().health <= 0:
			area.get_parent().remove_from_group("Zombie")
			area.get_child(0).play(death)
			area.get_parent().set_meta("alive", false)
		$"..".createImpact()
		get_parent().queue_free()
	
