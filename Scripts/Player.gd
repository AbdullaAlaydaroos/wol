extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D

@export_group('Locomotion')
@export var speed = 200
@export_group('Camera Sync')
@export var camera_sync = Camera2D
@export var should_camera_sync = true


func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	

func _process(delta: float) -> void:
	if global_position != camera_sync.global_position && should_camera_sync:
				camera_sync.global_position = global_position

func _physics_process(delta):
	get_input()
	move_and_slide()
