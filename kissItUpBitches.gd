extends Node

export var startingAnimFrame = 0

onready var sprite = get_child(0)
onready var tween = get_child(1)
onready var initialPos = sprite.get_pos()

var currentFrame

const step = 100
const timeBetweenSteps = 0.50

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
	currentFrame = startingAnimFrame
	set_process(true);
	
func _process(delta):
	if (tween.get_runtime() <= 0):
		var currentPos = sprite.get_pos()
		var finalPos = currentPos + positionOffsets[currentFrame];
		tween.interpolate_property(sprite, "transform/pos", currentPos, finalPos, timeBetweenSteps, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
		tween.start()
	
		sprite.set_flip_h(!sprite.is_flipped_h())
	
		if (currentFrame < (positionOffsets.size() - 1)):
			currentFrame = currentFrame + 1
		else:
			currentFrame = 0