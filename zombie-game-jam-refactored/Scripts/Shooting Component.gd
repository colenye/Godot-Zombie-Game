extends Node
class_name ShootingComponent
@export var playerInventoryComponent : PlayerInventoryComponent
@export var bullets : Node2D
@export var body : CharacterBody2D
var bulletSpeed : float
signal Shot

@export var pistolBullet : PackedScene
@export var rocketBullet : PackedScene
@export var hugePistolBullet : PackedScene
@export var laserBullet : PackedScene
@export var pistolBulletSpeed : float
@export var rocketBulletSpeed : float
@export var hugePistolBulletSpeed : float
@export var laserBulletSpeed : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Shot.connect(shoot)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerInventoryComponent.currentWeaponScene and Input.is_action_just_pressed("shoot") and playerInventoryComponent.currentWeaponScene.is_in_group("gun"):
		Shot.emit()

func shoot() -> void:
	var bull
	print(playerInventoryComponent.currentWeaponScene.name.to_lower())
	match playerInventoryComponent.currentWeaponScene.name.to_lower():
		"pistol":
			bull = pistolBullet.instantiate()
			bulletSpeed = pistolBulletSpeed
		"rocket":
			bull = rocketBullet.instantiate()
			bulletSpeed = rocketBulletSpeed
	
	if bull:
		bull.global_position += playerInventoryComponent.currentWeaponScene.get_child(0).position
		bull.global_rotation = body.get_angle_to(get_viewport().get_mouse_position())
		bull.velocity = Vector2(bulletSpeed, 0).rotated(body.get_angle_to(get_viewport().get_mouse_position()))
		bullets.add_child.call_deferred(bull)
