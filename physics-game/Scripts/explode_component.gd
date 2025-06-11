extends Node3D

@export var body : CharacterBody3D
@export var FORCE : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("explode"):
		$CollisionShape3D.disabled = false
	if Input.is_action_just_released("explode"):
		$CollisionShape3D.disabled = true


func _on_area_entered(area: Area3D) -> void:
	if area.get_parent() is RigidBody3D:
		area.get_parent().apply_impulse((area.get_parent().global_position - body.global_position).normalized() * FORCE)
