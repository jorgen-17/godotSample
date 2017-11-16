extends Label

# class member variables go here, for example:
var a = 1

func _ready():
	# Called every time the node is added to the scene.
	set_process(true)
	
func _process(delta):
	a += 1
	set_text("i love you this much: " + str(a))