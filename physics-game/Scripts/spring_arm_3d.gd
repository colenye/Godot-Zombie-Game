extends SpringArm3D

@export var mouse_sensibility : float = 0.005
@export var body : CharacterBody3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		
		body.rotation.y -= event.relative.x * mouse_sensibility
		body.rotation.x -= event.relative.y * mouse_sensibility
		
