extends State

@export var body : CharacterBody2D
func Enter():
	animPlayer.play("run")

func Update(delta: float):
	if body.velocity == Vector2.ZERO:
		state_transition.emit(self, "idle")
		
