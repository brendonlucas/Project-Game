extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("atacar"):
		get_parent().get_parent().get_node(".").passs()


func _on_Area_body_entered(body):
	if body.name == "Player_hack":
		get_parent().get_parent().get_node("complete_game/complete_label/AnimationPlayer").play("complete")
		
		queue_free()
