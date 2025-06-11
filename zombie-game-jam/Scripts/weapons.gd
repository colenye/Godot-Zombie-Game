extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.y += 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_rotation = $"..".get_angle_to(get_global_mouse_position())
	
	if global_rotation_degrees < -90 or global_rotation_degrees > 90:
		for c in $".".get_children():
			c.flip_v = true
			
	else:
		for c in $".".get_children():
			c.flip_v = false
		
