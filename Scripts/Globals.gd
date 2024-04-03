extends Node

# variabler
var fullName : String = "error"
var password : String = "test";
var email : String  = "test@gmail.com";
var userId : int;
var gameId : int;
var moneyBank : int;
var moneyPerson : int;
var days : int;
var upgrades : int;
var bills : int;
var radioParts : int;
var work : int;
var hunger : int;
var hasWorkedToday : bool = false;

# signaler db
signal response()
signal login()
signal signup()
signal get_leaderboard()
signal create_game()
signal load_game()
signal save_game()

# signaler other
signal dayCounter()
signal moneyCounter()
signal hungerCounter()
signal bankCounter()
