extends Node2D

@onready var rng = RandomNumberGenerator.new()
@onready var target = load("res://Scenes/Target.tscn")
@onready var targets = $Targets
@onready var timer = $Timer
@onready var progressTimer = $ProgressBar
@onready var targetSpawnTimer = $targetSpawnTimer
@onready var cameraWidth = get_viewport_rect().size.x
@onready var cameraHeight = get_viewport_rect().size.y
@export var targetAmount = 2
@export var targetVariance = 500
@export var misses = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	targetSpawn()
	timer.start()
	targetSpawnTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progressTimer.value = timer.time_left
	print(misses)

func targetSpawn():
	rng.randomize()
	for c in range(targetAmount):
		var randx = rng.randi_range(-cameraWidth / 2, cameraWidth / 2)
		var randy = rng.randi_range(-cameraHeight / 2, cameraHeight / 2)
		var targetInst = target.instantiate()
		targetInst.global_position.x = randx
		targetInst.global_position.y = randy
		targets.add_child.call_deferred(targetInst)


func _on_timer_timeout() -> void:
	if targets.get_child_count() != 0:
		print("FAILURE")
	else:
		print("success")


func _on_target_spawn_timer_timeout() -> void:
	targetSpawn()
	targetSpawnTimer.wait_time -= 0.01
	targetSpawnTimer.start()
