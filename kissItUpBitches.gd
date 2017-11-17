extends Node

export var startingAnimFrame = 0

onready var sprite = get_child(0)
onready var tween = get_child(1)

var currentFrame = startingAnimFrame

var step = 100

var positionOffsets = [
	Vector2(-step, -step),
	Vector2(-step, -step),
	Vector2(0, -step),
	Vector2(step, -step),
	Vector2(step, step/2),
	Vector2(step, -step/2),
	Vector2(step, step),
	Vector2(0, step),
	Vector2(-step, step),
	Vector2(-step, step)
]

func _ready():
	pass

func _flip_and_move():
	sprite.set_flip_h(!sprite.is_flipped_h())
	sprite.set_pos(sprite.get_pos() + positionOffsets[currentFrame])
	
	if (currentFrame < (positionOffsets.size() - 1)):
		currentFrame = currentFrame + 1
	else:
		currentFrame = 0