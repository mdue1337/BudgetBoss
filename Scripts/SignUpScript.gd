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
	else:
		var popup = get_parent().get_node("Fail")
		popup.visible = true
		print("Please provide valid username, password and email")
		Gs.emit_signal("get_nonce")

func handle_response(response):
	if response.status != "no_return":
		Gs.userId = int(response.response.data[0]["Id"]);
		var success = get_parent().get_node("Win")
		success.visible = true
		get_owner().visible = false
		get_tree().change_scene("res://Scenes/Main_Menu.tscn")
	else:
		Gs.emit_signal("get_nonce")
		var popup = get_parent().get_node("Fail")
		popup.visible = true
