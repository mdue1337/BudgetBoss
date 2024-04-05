extends TextureButton

var medicineCost = 200;

func _ready():
	get_parent().get_node("Label2").text = str(medicineCost) + "$"
	print(get_parent().get_node("Label2").text + str(medicineCost))

func _on_BuyMedicine_pressed():
	Gs.moneyBank =- medicineCost;
	get_parent().visible = false
