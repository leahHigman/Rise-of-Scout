class_name Player extends CharacterBody2D

#@export var speed := 500
#@export var fall_gravity := 4000
#@export var jump_gravity := 2000
#@export var jump_impulse := 1200

@export var maxJumpHeight := 256
@export var jumpDistance:= 256
@export var speed:= 512

@onready var gravity = -(((-2 * maxJumpHeight) * (speed * speed)) / (jumpDistance * jumpDistance))
@onready var jump_gravity = gravity
@onready var fall_gravity = gravity

@onready var jump_impulse = (((2 * maxJumpHeight) * speed) / (jumpDistance))

var jumpStart = Vector2(0,0)
var jumpEnd = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(str(gravity))
	print("jImpulse" + str(jump_impulse))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(str(gravity))
	pass
