extends Node

func _ready():
	mudar_botao("up")

func _process(delta):
	if Input.is_action_pressed("ui_down"):
		mudar_botao("down")
	if Input.is_action_pressed("ui_up"):
		mudar_botao("up")

func mudar_botao(valor):
	if valor == "up":
		$"Button0".grab_focus()

func _on_Button0_pressed():
	Game.nova_cena("res://niveis/teste/Teste.tscn")

func _on_Button1_pressed():
	pass