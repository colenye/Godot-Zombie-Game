extends CharacterBody2D
class_name Enemy
@export var speed : float
@export var rotationSpeed : float
@export var playerBody : CharacterBody2D

func _physics_process(delta: float) -> void:
	move_and_slide()
