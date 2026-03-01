extends PlayerState

var jumpFrame = 0

func enter(previous_state_path: String, data := {}) -> void:
	jumpFrame = 1
	player.velocity.y = -player.jump_impulse
	player.jumpStart = player.global_position
	#player.animation_player.play("jump")

func physics_update(delta: float) -> void:
	#print("y-vel " + str(player.velocity.y))
	#print("grav " + str(player.jump_gravity * delta))
	#print("frame " + str(jumpFrame))
	jumpFrame += 1
	var input_direction_x := Input.get_axis("move_left", "move_right")
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.jump_gravity * delta 
	player.move_and_slide()
	#print("post y-vel " + str(player.velocity.y) + "\n")
	


	if player.velocity.y >= 0:
		player.jumpEnd = player.global_position
		var height = player.jumpStart.y - player.jumpEnd.y
		print(str(height))
		print(str(sqrt(height / player.maxJumpHeight)))
		finished.emit(FALLING)
