extends Control

var scene = preload("res://maps/menu_inicial/menu_principal.tscn")
func _ready():
	pass # Replace with function body.

func change_scene():
	BackgroundLoad.load_scene("res://maps/menu_inicial/menu_principal.tscn")
#	get_tree().change_scene("res://maps/menu_inicial/menu_principal.tscn")
