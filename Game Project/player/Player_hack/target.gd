extends Spatial

var player

func _ready():
	pass

func _process(delta):
	player = get_parent().get_node_or_null("Player_hack")
	if player:
		translation = player.translation
	
