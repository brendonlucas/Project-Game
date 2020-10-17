extends Spatial

const DAMAGE = 15
var bullet_scene = preload("res://enemy/cube/bullet.tscn")
var target

func _ready():
	pass

func fire_weapon():
	var clone = bullet_scene.instance()
	var scene_root = get_tree().get_root().get_node(".")
	scene_root.add_child(clone)
	clone.global_transform = self.global_transform
	clone.scale = Vector3(0.5, 0.5, 0.5)
	
func _process(delta):
#	if get_parent().get_parent().get_node(".").ativo:
	if target:
		var alvo = target.translation
		alvo.y = 1.5
		look_at(alvo, Vector3.UP)
	
func set_target(body):
	target = body
