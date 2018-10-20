extends Node

func start():
	owner.mudar_animacao("Caindo",1,.2)
	owner.mudar_mobilidade_e_gravidade("ar","normal")

func update(delta):
	owner.mudar_escala_sprite(owner.direcao,1)

	var estado = owner.esta()
	if estado != "Caindo" :
		owner.mudar_estado(estado)