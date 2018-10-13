extends Node

export (float) var GRAVIDADE
export (float) var VELOCIDADE_MAXIMA_QUEDA
var tipo = ""

func _physics_process(delta):
	match tipo:
		"normal":
			if owner.movimento.y < VELOCIDADE_MAXIMA_QUEDA:
				owner.movimento.y += GRAVIDADE
		"desabilitar":
			owner.movimento.y = 0

func modificar_gravidade(novo_tipo):
	tipo = novo_tipo