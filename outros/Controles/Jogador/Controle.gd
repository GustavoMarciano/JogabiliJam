extends Node

func _input(event):
	owner.direcao = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))

	if Input.is_action_pressed("ui_ataque0") && owner.habilidade0.em_cd == false:
		owner.mudar_estado("Habilidade0")