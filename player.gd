extends CharacterBody2D



@export var MAX_SPEED = 500
@export var ACCELERATION = 1700
@export var FRICTION = 1200


@onready var axis = Vector2.ZERO


var leggy_in_range = false
var check_cameras = false



func _physics_process(delta):
	
	if leggy_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://leggy.dialogue"), "leggy")
	
	
	move(delta)
	
	
	

func get_input_axis():
	axis.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	axis.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	return axis.normalized()
	
	

func move(delta):
	axis = get_input_axis()
	
	if axis == Vector2.ZERO:
		apply_friction(FRICTION * delta)
	else:
		apply_movement(axis * ACCELERATION * delta)
	
	move_and_slide()
	

func apply_friction(amount):
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	
	else:
		velocity = Vector2.ZERO
		
		

func apply_movement(accel):
	velocity += accel
	velocity = velocity.limit_length(MAX_SPEED)





func _on_detection_area_body_entered(body):
	if body.has_method("leggy"):
		leggy_in_range = true
	if body.has_method("camera"):
		check_cameras = true


func _on_detection_area_body_exited(body):
	if body.has_method("leggy"):
		leggy_in_range = false
	if body.has_method("camera"):
		check_cameras = false
