extends Node

# variabler
var fullName : String = "error"
var password : String = "test";
var email : String  = "test@gmail.com";
var userId : int = 5;
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

# achievements
var Achievements : Array = ["We all start somewhere", "Bulking season", "Sweet Dreams", "Grind never stops (BRONZE)", "Grind never stops (SILVER)", "Grind never stops (GOLD)", "I am a mechanic", "Get me outta here", "Jack of all trades", "Pharmacist", "Shouln't I be dead now?", "Ebola"]
var achievementDB : int = 2;

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
signal add_user_achievement()
signal get_user_achievements()

# signaler other
signal dayCounter()
signal moneyCounter()
signal hungerCounter()
signal bankCounter()
signal workpay()

#background music
