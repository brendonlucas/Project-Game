extends Control

var creditos = preload("res://maps/creditos/creditos.tscn")

func _ready():
	pass


func pause():
	if get_parent().get_node_or_null("map_game"):
		get_parent().get_node_or_null("map_game").queue_free()
	get_tree().paused = true
	
func creditos():
	get_tree().change_scene("res://maps/creditos/creditos.tscn")

func set_end(value):
	Gamestate.final_game = value

func bloque_menu():
	Gamestate.ativar_menu = false

