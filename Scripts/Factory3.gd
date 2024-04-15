extends Node2D

var rng = RandomNumberGenerator.new()

var questionChosen;
var realsvar = 69;
var question1 = "Hvad betyder inflation?";
var question2 = "Hvad betyder deflation?";
var question3 = "Hvad er renter?";
var questArr : Array = [0, 1, 2];
#var question1 = "Hvad betyder det at inflationen går op?";
#var question2 = "Hvad betyder det at inflationen går ned?"; TIL NÆSTE ITERATION ELLER SÅDAN NOGET

#svar til spørgsmål 1 og 2
var answ1_1 = "Mine penge bliver mere værd";
var answ1_2 = "Mine penge bliver mindre værd";
var answ1_3 = "Varerne bliver større";

#svar til spørgsmål 3
var answ3_1 = "De penge du betaler for at tage et lån";
var answ3_2 = "Den pris som varerne i supermarkedet stiger med";
var answ3_3 = "De penge som nationalbanken printer";

func _ready():
	print("running answergen")
	answergen()

func _on_Button1_pressed():
	answer(1)
func _on_Button2_pressed():
	answer(2)
func _on_Button3_pressed():
	answer(3)

func answer(svar):
	if svar == realsvar:
		print("rigtigt");
		answergen()
	else:
		print("forkert");

func answergen():
	if(questArr.size() == 0): #case hvis alle er svaret
		print("Du har simpelthen klaret alle spørgsmålene")
		get_node("AcceptDialog").visible = true
		
		Gs.hasWorkedToday = true;
		Gs.emit_signal("workpay", 3)
		Gs.emit_signal("hungerCounter", -2)
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene("res://Scenes/Camp.tscn")
		
	else:
		print("---------------------------")
		print("Der er " + str(questArr.size()) + " i arrayet. Arrayet har dataen: " + str(questArr))
		var randomIndex = rng.randi_range(0, questArr.size());
		var randomNumber = questArr[randomIndex-1]
		print("randomindex: " + str(randomIndex) + " randomnumber: " + str(randomNumber))
		
		populateAnswers(randomNumber)

func populateAnswers(question):
	match question:
		0: #question 1
			print("case 0")
			get_node("Button1/Label").text = answ1_1
			get_node("Button2/Label").text = answ1_2
			get_node("Button3/Label").text = answ1_3
			
			questionChosen = question1
			print("QuestionChosen: " + str(questionChosen))
			get_node("Question/Label").text = questionChosen;
			questArr.erase(0); #fjerner spørgsmålet fra arrayet
			
			realsvar = 2
		1: #question 2
			print("case 1")
			get_node("Button1/Label").text = answ1_1
			get_node("Button2/Label").text = answ1_2
			get_node("Button3/Label").text = answ1_3
			
			questionChosen = question2
			print("QuestionChosen: " + str(questionChosen))
			get_node("Question/Label").text = questionChosen;
			questArr.erase(1); #fjerner spørgsmålet fra arrayet
			
			realsvar = 1
		2: #question 3
			print("case 2")
			get_node("Button1/Label").text = answ3_1
			get_node("Button2/Label").text = answ3_2
			get_node("Button3/Label").text = answ3_3
			
			questionChosen = question3
			print("QuestionChosen: " + str(questionChosen))
			get_node("Question/Label").text = questionChosen;
			questArr.erase(2); #fjerner spørgsmålet fra arrayet
			
			realsvar = 1
		_: #catch error
			print("SWITCHBOARD ERROR")
