extends State

func Enter():
	animPlayer.play("idle")

func Update(delta: float):
	if Input.is_action_just_pressed("left"):
		state_transition.emit(self, "run")
