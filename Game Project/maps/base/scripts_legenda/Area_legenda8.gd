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


func _on_Area_legenda8_body_entered(body):
	if body.name == "Player_v4":
		get_parent().get_node("Controler_map").start_legenda_upload()
		queue_free()
