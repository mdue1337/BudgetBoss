extends Control

var is_open : bool = false;

func _ready():
	if Gs.work == 1:
		$ColorRect/WorkLevel/Sprite.texture = preload("res://Scenes/Inventory/worklevel1.png")
		$ColorRect/WorkLevel/Sprite.scale = Vector2(0.13, 0.13)
		$ColorRect/WorkLevel/Label.text = str(Gs.work) + "/3"
	elif Gs.work == 2:
		$ColorRect/WorkLevel/Sprite.texture = preload("res://Scenes/Inventory/worklevel2.png")
		$ColorRect/WorkLevel/Sprite.scale = Vector2(0.16, 0.16)
		$ColorRect/WorkLevel/Label.text = str(Gs.work) + "/3"
	elif Gs.work == 3:
		$ColorRect/WorkLevel/Sprite.texture = preload("res://Scenes/Inventory/work3level.png")
		$ColorRect/WorkLevel/Sprite.scale = Vector2(0.10, 0.10)
		$ColorRect/WorkLevel/Label.text = str(Gs.work) + "/3"
	else:
		$ColorRect/WorkLevel/Label.text = "0" + "/3"
	
	updateCountMedicine()
	updateCountRadio()

func updateCountMedicine():
	$ColorRect/Medicine/Label.text = str(Gs.medicineCount)

func updateCountRadio():
	$ColorRect/RadioParts/Labe.text = str(Gs.radioParts) + "/5"

func _on_TextureButton_pressed():
	visible = false;
