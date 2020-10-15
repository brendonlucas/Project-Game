extends Control

var creditos = preload("res://maps/creditos/creditos.tscn")

func _ready():
	pass


func pause():
	get_tree().paused = true

func creditos():
	get_tree().change_scene("res://maps/creditos/creditos.tscn")

func set_end(value):
	Gamestate.final_game = value
