extends Node
class_name State
signal state_transition(sourceState: State, newState: String)
@export var animPlayer : AnimationPlayer

func Enter():
	pass

func Exit():
	pass

func Update(delta: float) -> void:
	pass
