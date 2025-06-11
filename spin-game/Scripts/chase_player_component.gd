extends Node2D


@export var SPEED : int = 500


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if get_parent().is_in_group("enemy"):
		var playerPosition = get_tree().get_root().get_child(0).get_child(0).global_position
		var pos = get_parent().global_position
		var dir = (playerPosition - pos).normalized()
		get_parent().velocity = dir * SPEED
		get_parent().move_and_slide()
