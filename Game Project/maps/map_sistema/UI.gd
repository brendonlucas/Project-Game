extends Control

func _ready():
	pass 


func _on_Button_reset_pressed():
	get_tree().reload_current_scene()
	
