extends CanvasLayer

func _ready():
	$TextureProgress.max_value = owner.max_hp
	$Label.text = "Nível:  " + str(owner.nivel)

func _on_HP_hp_changed(hp_atual):
	$TextureProgress.value = owner.hp

func _on_PersonagemTeste_nivel_changed(valor):
	$Label.text = "Nível:  " + str(valor)