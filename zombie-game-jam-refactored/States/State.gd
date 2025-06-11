extends Node
class_name State
signal state_transition(sourceState: State, newState: String)
@export var animPlayer : AnimationPlayer
@export var sprite : AnimatedSprite2D


func Enter():
	pass
func Exit():
	pass
func Update(delta: float):
	pass

func Rotate():
	var xDir = Input.get_axis("left", "right")
	if xDir < 0:
		sprite.scale.x = 1
		for c in sprite.get_children():
			c.flip_v = true
	elif xDir > 0:
		sprite.scale.x = -1
		for c in sprite.get_children():
			c.flip_v = false
		
	
	if Input.is_action_just_pressed("shoot") :
		state_transition.emit(self, "shoot")
