extends TextureButton
signal Verify()

func _on_Button_pressed():
	var password_input = get_parent().get_node("Password")
	var email_input = get_parent().get_node("Email")
	print(email_input.text)
	print(password_input.text)
	
	print("Login button pressed")
	#checker om felterne er tomme
	if email_input.text != "" and password_input.text != (""):
		#gemmer data til global variables
		Gs.loginEmail = email_input.text
		Gs.loginPw = password_input.text
		
		print("Login.gd - attempting login")
		emit_signal("Verify")
		print("Login.gd - Signal emit finish")
		
		#Gemmer login screen, da det er en popup over en anden scene
		var loginscreen = get_parent().get_parent()
		loginscreen.visible = false
		
		#viser success popup
		var success = get_parent().get_parent().get_parent().get_node("Win")
		success.visible = true
		
	else:
		#viser fail popup
		print("Nothing Written!")
		var popup = get_parent().get_parent().get_parent().get_node("Lose")
		popup.visible = true
