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
var bills : int;
var radioParts : int;
var work : int;
var hunger : int;
var hasWorkedToday : bool = false;
var illnessLevel : int;
var medicineCount : int;
var accident : bool = false;
var newPLayer: bool = true;

# shop
var upgradePricesWork : Array = [700, 900, 1300];
var upgradePricesRadio : Array = [1250, 1500, 1750, 2000, 2250];

# signaler db
signal response()
signal login()
signal signup()
signal get_leaderboard_days()
signal get_leaderboard_money()
signal save_leaderboard()
signal create_game()
signal load_game()
signal save_game()

# signaler other
signal dayCounter()
signal moneyCounter()
signal hungerCounter()
signal bankCounter()
signal workpay()
