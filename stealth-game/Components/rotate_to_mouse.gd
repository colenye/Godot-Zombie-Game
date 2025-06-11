extends Node2D

@export var body : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if body:
		var mouse_pos = get_viewport().get_mouse_position()
		var direction = (mouse_pos - body.global_position).normalized()
		var calculated_angle = atan2(direction.y, direction.x)
		body.global_rotation = calculated_angle
		print(calculated_angle)
