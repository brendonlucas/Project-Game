extends Spatial

const DAMAGE = 15
var bullet_scene = preload("res://enemy/bullet_enemy.tscn")

func _ready():
	pass

func fire_weapon():
	var clone = bullet_scene.instance()
	var scene_root = get_parent().get_parent().get_node(".")
	scene_root.add_child(clone)
	# Set the bullet's global_transform to that of the pistol spawn point (which is this node).
	clone.global_transform = self.global_transform
	# The bullet is a little too small (by default), so let's make it bigger!
	#clone.scale = Vector3(1, 1, 1)
	# Set how much damage the bullet does
	#clone.BULLET_DAMAGE = DAMAGE


