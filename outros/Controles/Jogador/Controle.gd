extends Node

func _input(event):
	owner.direcao = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))

	if Input.is_action_just_pressed("ui_up") && owner.is_on_floor():
		owner.mudar_estado("Pulando")

	if Input.is_action_just_pressed("ataque0"):
		owner.mudar_estado("Ataque0") 