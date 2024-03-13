extends TextureButton

func _on_SignupButton_pressed():
	var signup = get_owner().get_node("SignUp")
	signup.visible = true
	var login = get_owner().get_node("LogIn")
	login.visible = false
