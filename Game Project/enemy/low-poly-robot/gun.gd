extends Spatial

const DAMAGE = 15
var bullet_scene = preload("res://enemy/cube/bullet.tscn")

var target

func _ready():
	pass
	

func fire_weapon():
	look_at(target, Vector3.UP)
	var clone = bullet_scene.instance()
	var scene_root = get_tree().get_root().get_node(".")
	scene_root.add_child(clone)
	
	clone.global_transform = self.global_transform
	clone.scale = Vector3(0.5, 0.5, 0.5)

func set_target(body):
	body.y += 1
	target = body
