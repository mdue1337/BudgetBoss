extends TextureButton

func _on_Button_pressed():
	var password_input = get_parent().get_node("NinePatchRect/VBoxContainer/Password").text
	print(password_input)
	var email_input = get_parent().get_node("NinePatchRect/VBoxContainer/Email").text
	print(email_input)
	
	#checker om felterne er tomme
	if email_input != "" and password_input != (""):
		#gemmer data til global variables
		Gs.email = email_input
		Gs.password = password_input
		
		# emit signal til database
		Gs.emit_signal("login")
		Gs.connect("response", self, "handle_response")
	else:
		var popup = get_parent().get_node("Lose")
		popup.visible = true
		popup.dialog_text = "Please enter some info"

func handle_response(response):
	print(response)
	if response.error == "database_error":
		print("Nothing Written!")
		var popup = get_parent().get_node("Lose")
		popup.visible = true
		popup.dialog_text = "User not found"
	else:
		print(response.response["data"][0]["Id"])
		Gs.userId = int(response.response["data"][0]["Id"])
		Gs.fullName = String(response.response["data"][0]["Name"])
		
		#Gemmer login screen, da det er en popup over en anden scene
		var loginscreen = get_parent()
		loginscreen.visible = false
		
		#viser success popup
		var success = get_parent().get_node("Win")
		success.visible = true
