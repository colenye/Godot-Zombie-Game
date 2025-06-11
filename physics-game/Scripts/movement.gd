extends Node3D

@export var body : CharacterBody3D
@export var SPEED : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	body.velocity = Vector3.ZERO
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	input_dir = ($"..".transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	body.velocity = input_dir * SPEED
	
	
	body.move_and_slide()
