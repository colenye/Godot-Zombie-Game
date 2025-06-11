extends State
class_name PlayerIdle

func Enter():
	animPlayer.play("idle")

func Update(delta: float):
	Rotate()
	if Input.get_vector("left", "right", "up", "down"):
		state_transition.emit(self, "run")
