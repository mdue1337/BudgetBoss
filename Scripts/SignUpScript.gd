extends TextureButton

func _on_Button_pressed():
	print("CreateAccount.gd - button pressed")
	var username_input = get_owner().get_node("NinePatchRect/VBoxContainer/UserName")
	var password_input = get_owner().get_node("NinePatchRect/VBoxContainer/Password")
	var email_input = get_owner().get_node("NinePatchRect/VBoxContainer/Email")
	
	if username_input.text != "" and password_input.text != "" and "@" in email_input.text:
		print("CreateAccount.gd - attempting to create user")
		Gs.fullname = username_input.text
		print("Username set to")
		print(Gs.fullname)
		Gs.password = password_input.text
		print("Password set to")
		print(Gs.password)
		Gs.email = email_input.text
		print("Email set to")
		print(Gs.email)
		
		print("CreateAccount.gd - attempting login - emitting signal")
		emit_signal("Create")
		var success = get_parent().get_parent().get_parent().get_node("PopupSuccess")
		success.visible = true
		get_owner().visible = false
	else:
		var popup = get_parent().get_parent().get_parent().get_node("Popup")
		popup.visible = true
		print("Please provide valid username, password and email")
