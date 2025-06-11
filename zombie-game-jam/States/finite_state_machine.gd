extends Node2D
class_name FiniteStateMachine

var states : Dictionary = {}
@export var initialState : State
var currentState : State
func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.connect("state_transition", changeState)
	if initialState:
		currentState = initialState
		currentState.Enter()

func changeState(sourceState: State, newStateName: String):
	if sourceState != currentState:
		print("Invalid changeState trying from: " + sourceState.name + " but currently in: " + currentState.name)
		return
	var newState = states.get(newStateName)
	
	if !newState:
		print("Invalid new state")
		return

	if currentState:
		currentState.Exit()
	currentState = newState
	currentState.Enter()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if currentState is State:
		currentState.Update(delta)
