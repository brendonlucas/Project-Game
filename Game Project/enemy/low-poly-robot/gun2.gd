extends Spatial

const DAMAGE = 15
var bullet_scene = preload("res://enemy/cube/bullet.tscn")
var player

func _ready():
	player = get_tree().get_root().get_node("Map/Player_v4").translation
	

func fire_weapon(body):
	var direcao = body.translation
	direcao.z = translation.z
	#direcao.x = translation.x
	look_at(direcao, Vector3.UP)
	var clone = bullet_scene.instance()
	var scene_root = get_tree().get_root().get_node(".")
	
	scene_root.add_child(clone)
	
	clone.global_transform = self.global_transform
	clone.scale = Vector3(0.5, 0.5, 0.5)
