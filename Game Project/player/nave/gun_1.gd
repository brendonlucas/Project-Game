extends Spatial

const DAMAGE = 15

var bullet_scene = preload("res://maps/map_inicial/bullet.tscn")
const H_LOOK_SENS = 0.6
const V_LOOK_SENS = 0.4


func _ready():
	pass
	
func fire_weapon():
	var clone = bullet_scene.instance()
	var scene_root = get_tree().root.get_children()[0]
	scene_root.add_child(clone)
	
	# Set the bullet's global_transform to that of the pistol spawn point (which is this node).
	clone.global_transform = self.global_transform
	# The bullet is a little too small (by default), so let's make it bigger!
	clone.scale = Vector3(1, 1, 1)
	# Set how much damage the bullet does
	#clone.BULLET_DAMAGE = DAMAGE


