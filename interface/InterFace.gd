extends CanvasLayer

func _ready():
	$TextureProgress.max_value = owner.max_hp
	$Label.text = "Nivel:  " + str(owner.nivel)

func _on_HP_mudar_hp(valor):
	$TextureProgress.max_value = owner.max_hp
	$"Tween".interpolate_property($"TextureProgress","value",$TextureProgress.value ,valor,.5,Tween.TRANS_BOUNCE,Tween.EASE_OUT)
	$"Tween".start()

func _on_PersonagemTeste_mudar_nivel(valor):
	$Label.text = "Nivel:  " + str(valor)