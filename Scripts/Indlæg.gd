extends TextureButton

var hospitalCost = Gs.illnessLevel * 100;
#hvor meget koster det at blive indlagt

func _ready():
	get_parent().get_node("Label2").text = str(hospitalCost) + "$"
	print(get_parent().get_node("Label2").text)

func _on_Indlg_pressed():
	hospitalCost = Gs.illnessLevel * 100;
	if (Gs.illnessLevel>0):
		if (Gs.moneyBank >= hospitalCost):
			print("hospitalcost: " + str(hospitalCost))
			Gs.emit_signal("bankCounter", -hospitalCost)
			Gs.illnessLevel = 0;
			
			for i in range(Gs.illnessLevel):
				Gs.emit_signal("dayCounter");
			get_parent().visible = false
		else:
			print("no money")
			get_parent().visible = false
			get_parent().get_parent().get_node("AcceptDialog").dialog_text = "Du har enten ikke råd til det, eller også har du glemt at lægge penge i banken."
			get_parent().get_parent().get_node("AcceptDialog").visible = true
	else:
		print("no illness")
		get_parent().visible = false



#tanken er at det er billigere at blive indlagt end købe medicin, men det koster tid alt efter sygdomsniveauet.
