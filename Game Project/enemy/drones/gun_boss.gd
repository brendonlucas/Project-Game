extends Spatial

const DAMAGE = 20
var bullet_scene = preload("res://enemy/drones/bullet_drone.tscn")
var player
func _ready():
	player = get_tree().get_root().get_node_or_null("Map/Player_nave")
	
	
func _process(delta):
	if player:
		var olhar = player.global_transform.origin
		look_at(olhar, Vector3.UP)
	
func fire_weapon():
	var clone = bullet_scene.instance()
	var scene_root = get_tree().root.get_children()[1]
	scene_root.add_child(clone)
	# Set the bullet's global_transform to that of the pistol spawn point (which is this node).
	clone.global_transform = self.global_transform
	# The bullet is a little too small (by default), so let's make it bigger!
	clone.scale = Vector3(1, 1, 1)
	# Set how much damage the bullet does
	#clone.BULLET_DAMAGE = DAMAGE


