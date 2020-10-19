extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_fechar_pressed():
	get_tree().paused = false
	get_parent().get_node("porta_5").queue_free()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	hide()
