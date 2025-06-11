extends State
class_name PlayerRun

func Enter():
	animPlayer.play("run")
	animPlayer.speed_scale = 0.5

func Update(delta: float):
	Rotate()
	var dir = Input.get_vector("left", "right", "up", "down")
	if !dir:
		state_transition.emit(self, "idle")
		
func Exit():
	animPlayer.speed_scale = 0.2
