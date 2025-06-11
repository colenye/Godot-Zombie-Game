extends Node

@onready var body : CharacterBody2D = get_parent()
@export var SPEED : float = 100
var speed : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speed = SPEED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	body.velocity = Vector2.ZERO
	var input_dir = Input.get_vector("left", "right", "up", "down").normalized()
	body.velocity = input_dir * speed
	body.move_and_slide()
	
	
	if Input.is_action_pressed("sprint"):
		speed = SPEED * 2
	if Input.is_action_just_released("sprint"):
		speed = SPEED
