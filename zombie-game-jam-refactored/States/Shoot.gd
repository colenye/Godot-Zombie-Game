extends State
class_name Shoot

@export var playerInventoryComponent: PlayerInventoryComponent
func Enter():
	if playerInventoryComponent.currentWeaponScene:
		animPlayer.play("knocked")
		playerInventoryComponent.currentWeaponScene.play("shoot")
		animPlayer.speed_scale = 0.5

func Update(delta: float):
	Rotate()
	var dir = Input.get_vector("left", "right", "up", "down")
	if !dir:
		state_transition.emit(self, "idle")
		
func Exit():
	animPlayer.speed_scale = 0.2
