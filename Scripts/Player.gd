extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D

@export_group('Locomotion')
@export var speed = 200
@export_group('Health')
@export var health = 100
@export var MAX_HEALTH = 100
@export var health_bar = ProgressBar
@export_group('Camera Sync')
@export var camera = Camera2D
@export var camera_sync = true


func _ready() -> void:
	health_bar.max_value = MAX_HEALTH

func _process(delta: float) -> void:
	sync_camera()
	animation()
	
	health_bar.value = health
	
	# Health Debug
	if Input.is_action_just_pressed('debug_0'):
		health -= 5
	
	if Input.is_action_just_pressed('debug_1'):
		health += 5
	

func _physics_process(delta):
	get_input()
	move_and_slide()

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func sync_camera():
	if global_position != camera.global_position && camera_sync:
		camera.global_position = global_position

func animation():
	sprite.play('idle')
	if velocity:
		sprite.play('run')
