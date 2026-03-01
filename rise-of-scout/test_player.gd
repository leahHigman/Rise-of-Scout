extends CharacterBody2D

enum States {IDLE, JUMPING, FALLING, RUNNING, BOUNCING}


var startHeight = 0
var jumping = false

@export var maxJumpHeight := 1000
@export var jumpDistance:= 1000
@export var speed:= 500

@onready var gravity = -((-2 * maxJumpHeight) * (speed ** 2))/ (jumpDistance ** 2)
@onready var jump_impulse = (((2 * maxJumpHeight) * speed) / jumpDistance)

@onready var jump_gravity = gravity
@onready var fall_gravity = gravity




func _physics_process(delta: float) -> void:
	velocity.y += fall_gravity * delta
	if Input.is_action_just_pressed("jump"):
		jump()
	var dir = Input.get_axis("move_left", "move_right")
	velocity.x = speed * dir
	move_and_slide()
	if not is_on_floor():
		if velocity.y >= 0 and jumping:
			var totalJump = startHeight - global_position.y
			var jumpAcc = totalJump / maxJumpHeight
			print("Pixels Jumped: " + str(totalJump))
			print("% Jumped: " + str(jumpAcc))
			jumping = false
	


func jump() -> void:
	velocity.y = - jump_impulse
	startHeight = global_position.y
	jumping = true
