class_name Player extends CharacterBody2D

#@export var speed := 500
#@export var fall_gravity := 4000
#@export var jump_gravity := 2000
#@export var jump_impulse := 1200

@export var maxJumpHeight := 256.0
@export var jumpDistance:= 256.0
@export var speed:= 256.0


@onready var gravity = -((-2 * maxJumpHeight) * (speed ** 2))/ (jumpDistance ** 2)
@onready var jump_impulse = (((2 * maxJumpHeight) * speed) / jumpDistance)

@onready var jump_gravity = gravity
@onready var fall_gravity = gravity

#var speed = 0
#var gravity = 10
#var jump_impulse = 100
#
#@onready var jump_gravity = gravity
#@onready var fall_gravity = gravity

var jumpStart = Vector2(0,0)
var jumpEnd = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(str(gravity))
	print("jImpulse" + str(jump_impulse))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

		
	pass
