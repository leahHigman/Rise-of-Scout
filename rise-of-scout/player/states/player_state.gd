class_name PlayerState extends State

const IDLE = "idle"
const WALKING = "walking"
const RUNNING = "running"
const TURNING = "turning"
const JUMPING = "jumping"
const FALLING = "falling"
const BUBBLE = "bubbleThrow"

var player: Player


func _ready() -> void:
	await owner.ready
	player = owner as Player
	print(player)
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
