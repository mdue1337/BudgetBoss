extends TextureButton

var medicineCost = Gs.illnessLevel * 200;

func _ready():
	get_parent().get_node("Label2").text = str(medicineCost) + "$"
	print(get_parent().get_node("Label2").text + str(medicineCost))

func _on_BuyMedicine_pressed():
	if (Gs.illnessLevel>0):
		Gs.moneyBank =- medicineCost
		get_parent().visible = false
		print("penge betalt")
	else:
		print("hvordan fick du den her menu frem????? skriv lige til devs")
		get_parent().visible = false
