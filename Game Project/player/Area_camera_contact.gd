extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	print(body.name)
	if body.name == "Player_v4":
		var mesh = get_tree().get_root().get_node_or_null("Map/Player_v4/Armature/Mesh")
		mesh.hide()


func _on_Area_body_exited(body):
	print("saiu")
	if body.name == "Player_v4":
		var mesh = get_tree().get_root().get_node_or_null("Map/Player_v4/Armature/Mesh")
		mesh.show()
