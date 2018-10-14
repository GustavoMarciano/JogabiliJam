extends Node

var tipo = ""

func _physics_process(delta):
	match tipo:
		"normal":
			owner.movimento.x = owner.direcao * (owner.velocidade_base + owner.buff_velocidade_movimento)
		"desabilitar":
			owner.movimento.x = 0
		"ar":
			owner.movimento.x = owner.direcao * (owner.velocidade_base + owner.buff_velocidade_movimento) / 1.5

func modificar_mobilidade(novo_tipo):
	tipo = novo_tipo