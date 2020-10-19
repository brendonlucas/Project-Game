extends Spatial

var laser = preload("res://enemy/cube/laser_red.tscn")
var ativou = false

func _ready():
	$Timer.start()
	$Timer_drop.start()

func _process(delta):
	if $Timer.time_left == 0 and !ativou:
		instance_laser()
		ativou = true
		
	if $Timer_drop.time_left == 0:
		queue_free()
		
func instance_laser():
	var clone = laser.instance()
	var scene_root = get_node(".")
	scene_root.add_child(clone)
