extends Node

signal show_final
var enemis_level = 1
var nivel = 0

func _on_PersonagemTeste_nivel_changed(valor):
	randomize()
	enemis_level = round(rand_range(valor-2,valor+4))
	nivel = valor

func _on_Morto_game_end(nivel,kills):
	emit_signal("show_final")
	$"Panel/ScoreFinal".text = "Nivel: " + str(nivel)
	$"Panel/Kills".text = str(kills) + "  Kill" 