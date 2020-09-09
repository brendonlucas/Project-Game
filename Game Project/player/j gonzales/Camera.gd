extends Camera

const H_LOOK_SENS = 0.4
const V_LOOK_SENS = 0.2

func _ready():
	pass
	
func _input(event):
	if event is InputEventMouseMotion:
		$".".rotation_degrees.x -= event.relative.y * V_LOOK_SENS
		$".".rotation_degrees.x = clamp($".".rotation_degrees.x, -90, 90)
		rotation_degrees.y -= event.relative.x * H_LOOK_SENS
