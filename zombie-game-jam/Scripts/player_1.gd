extends CharacterBody2D

@export var speed : float = 150
@export var hit : bool = false
@export var attack : bool = false
@export var stamina : float= 100
@export var staminaDeplationRate : float = 1
@export var staminaRegenerationRate : float = 1
@export var sprint : float = 1.5
@export var pistolAmmo : int = 115
@export var rocketAmmo : int = 5
@export var shotgunAmmo : int = 25

var sprinting = false
var initialSpeed = speed

@onready var main = get_tree().get_root()
@export var knife : Node2D
@export var pistol : Node2D
@onready var rocket = $Weapons/Rocket
@onready var staminaBar = $UI/HBoxContainer/left/Stamina
@onready var healthBar = $UI/HBoxContainer/right/maxAmmo
@onready var clipBar = $UI/HBoxContainer/right/Clip
@onready var reloadTimer = $Reload
@onready var pistol_bullet = load("res://Scenes/Bullets/Pistol_Bullet.tscn")
@onready var rocket_bullet = load("res://Scenes/Bullets/Rocket_Bullet.tscn")
@onready var instance

@onready var weapons = $Weapons.get_children()
var screen_size

@onready var flipped = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	screen_size = get_viewport_rect().size
	healthBar.value = $Weapons/Pistol.get_meta("totalAmount")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	movement()
	
		
	if Input.is_action_just_pressed("shoot"):
		for c in weapons:
			if c.visible:
				
				if c.get_meta("clipAmount") > 0:
					c.set_meta("clipAmount", c.get_meta("clipAmount") - 1)
					clipBar.value = c.get_meta("clipAmount")
					
					shoot(c)
	if Input.is_action_just_pressed("reload"):
		for c in weapons:
			if c.visible:
				var total = c.get_meta("totalAmount")
				var clipSize = c.get_meta("clipSize")
				var clipAmount = c.get_meta("clipAmount")
				if total - clipSize + clipAmount > 0:
					c.set_meta("totalAmount", total - clipSize + clipAmount)
					c.set_meta("clipAmount", clipSize)
				else:
					c.set_meta("totalAmount", 0)
					c.set_meta("clipAmount", clipAmount + total)
				clipBar.value = c.get_meta("clipAmount")
				healthBar.value = c.get_meta("totalAmount")

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	else:
		pass
		
	move_and_slide()

func shoot(inst):
	match inst.name:
			"Pistol":
				instance = pistol_bullet.instantiate()
			"Rocket":
				instance = rocket_bullet.instantiate()
	
	instance.dir = get_angle_to(get_global_mouse_position())
	instance.pos = global_position
	main.add_child.call_deferred(instance)
	$BulletTimeout.start()
		
func movement():
	velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("sprint") and stamina > 30:
		if !sprinting:
			speed = initialSpeed * sprint
		sprinting = true
	if Input.is_action_just_released("sprint") or $SprintRegen.time_left:
		speed = initialSpeed / sprint
		sprinting = false
	
	if sprinting and stamina > 0:
		stamina -= staminaDeplationRate
		if stamina < 0:
			stamina = 0
	if stamina < 1:
		$SprintRegen.start()
		sprinting = false
	
	if stamina < 100:
		stamina += staminaRegenerationRate
		if stamina > 100:
			stamina = 100
	
	staminaBar.value = stamina
	


func _on_bullet_timeout_timeout() -> void:
	if instance:
		instance.queue_free()
