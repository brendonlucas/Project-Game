extends Interactable

var dor
var ativo = false
var status_porta

func _ready():
	pass
	#dor = get_parent().get_node("AnimationPlayer")

func get_interactable_text():
	return "Pegar nota"
		
func set_active(option):
	ativo = option

func interact():
	if !ativo :
		$CollisionShape.disabled = true
		get_tree().get_root().get_node("Map/notas").nota_ativa = "021"
		get_tree().get_root().get_node("Map/notas").mostrar("res://Images/notas/note021.png")
		
		#ativo = true
