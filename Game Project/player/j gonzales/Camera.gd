extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const H_LOOK_SENS = 0.4
const V_LOOK_SENS = 0.2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	
func _input(event):
	if event is InputEventMouseMotion:
		$".".rotation_degrees.x -= event.relative.y * V_LOOK_SENS
		$".".rotation_degrees.x = clamp($".".rotation_degrees.x, -90, 90)
		rotation_degrees.y -= event.relative.x * H_LOOK_SENS
