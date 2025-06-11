extends Node2D

@export var nukeImpact = load("res://Scenes/Nuke Impact.tscn")
@export var main : Node2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var nukeImpact = nukeImpact.instantiate()
		nukeImpact.global_position = get_global_mouse_position()
		nukeImpact.get_child(0).play("default")
		main.add_child(nukeImpact)
		
