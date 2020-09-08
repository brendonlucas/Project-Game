extends Camera

const H_LOOK_SENS = 7
const V_LOOK_SENS = 7

export var distance = 4
export var altura = 1.5

var cam

# Called when the node enters the scene tree for the first time.
func _ready():
	cam = get_node(".")
	set_physics_process(true)
	# set_as_toplevel(true)
	
	

func _physics_process(delta):
	pass
	# segue(delta)





func segue(delta):
	var target = get_parent().global_transform.origin
	var pos = global_transform.origin
	var up = Vector3(0,1,0)
	
	var offset = pos - target
	
	offset = offset.normalized() * distance
	offset.y = altura
	
	pos = target + offset
	
	look_at_from_position(pos, target, up)





