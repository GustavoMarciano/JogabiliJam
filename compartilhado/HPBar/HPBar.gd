extends Position2D

func _ready():
	$TextureProgress.max_value = owner.max_hp

func _on_HP_mudar_hp(valor):
	$"Tween".interpolate_property($"TextureProgress","value",$TextureProgress.value ,valor,2,Tween.TRANS_BOUNCE,Tween.EASE_OUT)
	$"Tween".start()