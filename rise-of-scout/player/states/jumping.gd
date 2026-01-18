extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.y = -player.jump_impulse
	player.jumpStart = player.global_position
	#player.animation_player.play("jump")

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.jump_gravity * delta
	player.move_and_slide()

	if player.velocity.y >= 0 or Input.is_action_just_released("jump"):
		player.jumpEnd = player.global_position
		var height = player.jumpStart.y - player.jumpEnd.y
		print(str(height))
		finished.emit(FALLING)
