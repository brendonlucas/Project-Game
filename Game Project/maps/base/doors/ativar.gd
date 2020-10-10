extends Interactable

var dor
var open = false
var status_porta
func _ready():
	dor = get_parent().get_node("AnimationPlayer")

func get_interactable_text():
	return "Usar"
	
func interact():
	if open and get_parent().get_node(".").get_active():
		dor.play("close")
		open = false
		get_parent().get_node("dor").play()
	elif !open and get_parent().get_node(".").get_active():
		dor.play("open")
		open = true
		get_parent().get_node("dor").play()
	elif !get_parent().get_node(".").get_active():
		get_tree().get_root().get_node("Map/Controler_map").start_legenda_elevador()
func set_open(option):
	open = option
