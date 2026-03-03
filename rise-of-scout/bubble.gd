class_name Bubble
extends RigidBody2D

var strength = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func bounce(player):
	var bounceAngle = get_angle_to(player.position)
	print(rad_to_deg(bounceAngle))
	var test = Vector2(1,0).rotated(bounceAngle) * 2000
	player.velocity += test
	
