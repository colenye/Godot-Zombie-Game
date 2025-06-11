extends Movement
class_name PlayerMovementComponent
@export var SPEED = 100
@export var sprint : float = 1.5
@onready var initialSpeed = SPEED
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	body.velocity = Vector2.ZERO
	var input_dir = Input.get_vector("left", "right", "up", "down").normalized()
	body.velocity = input_dir * SPEED
	
	if Input.is_action_just_pressed("sprint"):
		SPEED *= sprint
	if Input.is_action_just_released("sprint"):
		SPEED = initialSpeed
