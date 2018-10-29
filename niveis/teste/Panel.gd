extends Panel


func _ready():
	self.set_process(false)
	$"Button".grab_focus()

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		mudar_botao("left")
	if Input.is_action_pressed("ui_right"):
		mudar_botao("right")

func _on_Teste_show_final():
	show()
	self.set_process(true)

func mudar_botao(valor):
	if valor == "left":
		$"Button".grab_focus()
	if valor == "right":
		$"Button2".grab_focus()

func _on_Button_pressed():
	Game.nova_cena("res://niveis/teste/Teste.tscn")

func _on_Button2_pressed():
	Game.nova_cena("res://niveis/menu_principal/MenuPrincipal.tscn")
