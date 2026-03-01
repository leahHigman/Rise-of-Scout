class_name Bubble
extends RigidBody2D

var strength = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var colliders = get_colliding_bodies()
	if colliders:
		#print(colliders[0].get_name())
		pass
	pass


func _on_body_entered(body: Node) -> void: #I believe this does not work
	print("test")
