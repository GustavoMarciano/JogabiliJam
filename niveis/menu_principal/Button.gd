extends Button


func _on_Button0_focus_entered():
	self.DRAW_HOVER
	if Input.is_action_pressed("ui_ataque0"):
			Game.nova_cena("res://niveis/teste/Teste.tscn")