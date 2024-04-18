# Signup/Button script

extends TextureButton

func _on_Button_pressed():
	print("CreateAccount.gd - button pressed")
	var username_input = get_owner().get_node("NinePatchRect/VBoxContainer/UserName")
	var password_input = get_owner().get_node("NinePatchRect/VBoxContainer/Password")
	var email_input = get_owner().get_node("NinePatchRect/VBoxContainer/Email")
	
	if username_input.text != "" and password_input.text != "" and "@" in email_input.text:
		Gs.fullName = username_input.text
		Gs.password = password_input.text
		Gs.email = email_input.text
		
		Gs.emit_signal("signup")
		Gs.connect("response", self, "handle_response")
		
		var success = get_parent().get_node("Win")
		success.visible = true
		get_owner().visible = false
	else:
		var popup = get_parent().get_node("Fail")
		popup.visible = true
		print("Please provide valid username, password and email")

func handle_response(response):
	print(response)
