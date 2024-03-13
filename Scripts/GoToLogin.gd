extends TextureButton

func _on_LoginButton_pressed():
	var login = get_owner().get_node("LogIn")
	login.visible = true
	var signup = get_owner().get_node("SignUp")
	signup.visible = false
