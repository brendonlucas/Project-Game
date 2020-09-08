extends Control

# These first 3 members are for the sprite animation.
const MAX_FRAME_FOR_SPRITE = 4
const FRAME_SWITCH_TIME = 0.2

var frame_switch_timer = 0
var viewport_initial_size = Vector2()

onready var viewport = $Viewport
onready var viewport_sprite = $Control/ViewportSprite

var map_control

func _ready():
	#viewport_sprite.modulate = Color(1, 1,1, 0.01)
	get_viewport().connect("size_changed", self, "_root_viewport_size_changed")
	#viewport_initial_size = viewport.size
	viewport.set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	viewport_sprite.texture = viewport.get_texture()



# Simple frame-based animation.
func _process(delta):
	if Input.is_action_just_pressed("emitir sinal"):
		map_control = get_tree().root.get_node("map_teste")
		map_control.printar()
		
func _root_viewport_size_changed():
	pass
	#viewport.size = Vector2.ONE * get_viewport().size.y
	#viewport_sprite.scale = Vector2.ONE * viewport_initial_size.y / get_viewport().size.y
