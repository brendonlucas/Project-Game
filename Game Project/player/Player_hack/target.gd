extends Spatial

var player

func _ready():
	pass

func _process(delta):
	player = get_parent().get_node("Player_hack")
	translation = player.translation
	
