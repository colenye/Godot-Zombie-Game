extends Node2D

@export var rotateSpeed : float = 0.1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	get_parent().rotate(rotateSpeed)
