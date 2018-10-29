extends Node

onready var habilidade0 = owner.get_node("Estados/Habilidade0")
onready var habilidade1 = owner.get_node("Estados/Habilidade1")
onready var habilidade2 = owner.get_node("Estados/Habilidade2")


func _process(delta):
	owner.direcao = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
		
	if Input.is_action_pressed("ui_ataque0") && habilidade0.em_cd == false && habilidade0 != null && owner.atacando == false:
		owner.mudar_estado("Habilidade0")
	elif Input.is_action_pressed("ui_ataque1") && habilidade1.em_cd == false && habilidade1 != null && owner.atacando == false:
		owner.mudar_estado("Habilidade1")
	elif Input.is_action_pressed("ui_ataque2") && habilidade2.em_cd == false && habilidade2 != null && owner.atacando == false:
		owner.mudar_estado("Habilidade2")