extends Enemy


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2(speed, 0).rotated(self.get_angle_to(get_viewport().get_mouse_position()))

# Called every frame. 'delta' is the elapsed time since the previous frame.
