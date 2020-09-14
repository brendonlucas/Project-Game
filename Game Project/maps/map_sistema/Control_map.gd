extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var portao1_fechado = true
var portao2_fechado = true
var portao3_fechado = true
var portao4_fechado = true

var enemy
var enemy2
var enemy3
var enemy4
var enemy5
var enemy6
var enemy7
var enemy8
var enemy9
var enemy10
var enemy11
var enemy12
var enemy13
var enemy14
var enemy15
var player
var player_death = false

func _ready():
	pass


func _process(delta):
	player = get_parent().get_node_or_null("Player_hack")
	enemy = get_parent().get_node_or_null("enemy_hack")
	enemy2 = get_parent().get_node_or_null("enemy_hack2")
	enemy3 = get_parent().get_node_or_null("enemy_hack_stop2")
	
	enemy4 = get_parent().get_node_or_null("enemy_hack3")
	enemy5 = get_parent().get_node_or_null("enemy_hack4")
	enemy6 = get_parent().get_node_or_null("enemy_hack_stop3")
	enemy7 = get_parent().get_node_or_null("enemy_hack_stop4")
	enemy8 = get_parent().get_node_or_null("enemy_hack_stop6")
	enemy9 = get_parent().get_node_or_null("enemy_hack_stop5")
	
	enemy10 = get_parent().get_node_or_null("enemy_hack5")
	enemy11 = get_parent().get_node_or_null("enemy_hack6")
	
	enemy12 = get_parent().get_node_or_null("enemy_hack8")
	enemy13 = get_parent().get_node_or_null("enemy_hack9")
	enemy14 = get_parent().get_node_or_null("enemy_hack_stop7")
	enemy15 = get_parent().get_node_or_null("enemy_hack_stop8")
	
	if portao1_fechado and !enemy and !enemy2 and !enemy3:
		get_parent().get_node("porta_1").queue_free()
		portao1_fechado = false
	
	if portao2_fechado and !enemy4 and !enemy5 and !enemy6 and !enemy7 and !enemy8 and !enemy9:
		get_parent().get_node("porta_2").queue_free()
		portao2_fechado = false
		
	if portao3_fechado and !enemy10 and !enemy11:
		get_parent().get_node("porta_3").queue_free()
		portao3_fechado = false
		
	if portao4_fechado and !enemy12 and !enemy13 and !enemy14 and !enemy15:
		get_parent().get_node("porta_4").queue_free()
		portao4_fechado = false
		
	if !player and !player_death:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_parent().get_node_or_null("UI").show()
		player_death = true
		
