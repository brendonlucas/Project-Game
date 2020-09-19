extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_open_body_entered(body):
	pass
	if body.name == "Player_v4":
		$AnimationPlayer.play("open")
	


func _on_Area_open_body_exited(body):
	pass
	if body.name == "Player_v4":
		$AnimationPlayer.play("close")
