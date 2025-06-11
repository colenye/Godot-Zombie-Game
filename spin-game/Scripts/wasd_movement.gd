extends Node2D

@onready var body : CharacterBody2D = get_parent()
@export var SPEED = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	body.velocity = Vector2.ZERO
	var input_dir = Input.get_vector("left", "right", "up", "down").normalized()
	body.velocity = input_dir * SPEED
	body.move_and_slide()
