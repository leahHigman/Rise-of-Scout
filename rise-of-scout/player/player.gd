extends CharacterBody2D

enum States {IDLE, RUNNING, JUMPING, FALLING, BOUNCING}

var state: States = States.IDLE

@export var maxJumpHeight := 256.0
@export var jumpDistance:= 256.0
@export var speed:= 512.0

@onready var gravity = -((-2 * maxJumpHeight) * (speed ** 2))/ (jumpDistance ** 2)
@onready var jump_impulse = (((2 * maxJumpHeight) * speed) / jumpDistance)

@onready var jump_gravity = gravity
@onready var fall_gravity = gravity * 2
@onready var current_gravity = jump_gravity

func set_state(new_state):
	var previous_state = state
	state = new_state
	print("Changes from " + str(previous_state) + " to " + str(state))
	
	if state == States.JUMPING:
		velocity.y = -jump_impulse
		current_gravity = jump_gravity
	
	elif state == States.FALLING:
		current_gravity = fall_gravity

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("move_left", "move_right")
	velocity.y += current_gravity * delta
	
	if state == States.IDLE:
		#velocity.x = move_toward(velocity.x, 0, speed/60)
		if direction:
			set_state(States.RUNNING)
		if Input.is_action_just_pressed("jump"):
			set_state(States.JUMPING)
		if not is_on_floor():
			set_state(States.FALLING)

	elif state == States.RUNNING:
		velocity.x = speed * direction
		if Input.is_action_just_pressed("jump"):
			set_state(States.JUMPING)
		if not direction:
			set_state(States.IDLE)

	elif state == States.FALLING:
		velocity.x = speed * direction
		if is_on_floor():
			set_state(States.IDLE)

	elif state == States.JUMPING:
		velocity.x = speed * direction
		if velocity.y >= 0 or Input.is_action_just_released("jump"):
			set_state(States.FALLING)
		pass

	var collision = get_last_slide_collision()
	if collision:
		var collider = collision.get_collider()
		if collider is Bubble:
			collider.bounce(self)
	
	print(velocity.x)
	move_and_slide()
