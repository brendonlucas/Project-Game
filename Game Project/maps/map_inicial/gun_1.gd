extends Spatial

const DAMAGE = 15

var bullet_scene = preload("res://player/nave/bullet.tscn")
const H_LOOK_SENS = 0.6
const V_LOOK_SENS = 0.4


func _ready():
	pass
	
func fire_weapon():
	var clone = bullet_scene.instance()
	var scene_root = get_tree().root.get_children()[0]
	scene_root.add_child(clone)
	clone.global_transform = self.global_transform


