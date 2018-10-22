extends Node

var enemis_level = 1
var nivel = 1

func _on_PersonagemTeste_nivel_changed(valor):
	randomize()
	enemis_level = randi() % valor + 5
	nivel = valor

func _on_Morto_game_end():
	$"Panel".show()
	$"Panel/ScoreFinal".text = "Nivel: " + str(nivel)

func _on_Button_pressed():
	Game.nova_cena("res://niveis/teste/Teste.tscn")