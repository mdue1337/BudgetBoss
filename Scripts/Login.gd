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
		
		#Gemmer login screen, da det er en popup over en anden scene
		var loginscreen = get_parent()
		loginscreen.visible = false
		
		#viser success popup
		var success = get_parent().get_node("Win")
		success.visible = true
		
	else:
		#viser fail popup
		print("Nothing Written!")
		var popup = get_parent().get_node("Lose")
		popup.visible = true

func handle_response(response):
	print("PRINTING FULL RESPONSE: ")
	print(response)
	print(response.response["data"][0]["Id"])
	Gs.userId = int(response.response["data"][0]["Id"])
