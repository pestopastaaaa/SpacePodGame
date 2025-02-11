extends CharacterBody2D



@export var MAX_SPEED = 500
@export var ACCELERATION = 1700
@export var FRICTION = 1200


@onready var axis = Vector2.ZERO





func _physics_process(delta):
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



