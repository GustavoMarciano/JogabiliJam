extends Node

export(float) var velocidade_animacao

func start():
	owner.mudar_animacao("Andando",velocidade_animacao,0.2)
	owner.mudar_mobilidade_e_gravidade("normal","normal")

func update(delta):
	owner.mudar_escala_sprite(owner.direcao,1)
	var estado = owner.esta()
	if estado != "Andando":
		owner.mudar_estado(estado)