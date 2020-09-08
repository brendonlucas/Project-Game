extends Area

var player
var tocou
var tocou_delete

func _ready():
	pass
	
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player_nave" and tocou != true:
			Gamestate.instanciar_agua()
			tocou = true
	for body in bodies:
		if body.name == "Remove_wather" and tocou_delete != true:
			var deletar = get_parent().get_node(".")
			deletar.queue_free()
			tocou_delete = true
