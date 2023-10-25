extends Control

# 4k
const games_sensitivities: Dictionary = {
	"Valorant": 0.0707589285714285,
	"CounterStrike": 0.0222372497081799,
	"Fortnite": 0.00561534231977053
}

@onready var game = $MarginContainer/VBoxContainer/HBoxContainer2/Game
@onready var sensitivity = $MarginContainer/VBoxContainer/HBoxContainer2/Sensitivity

func _ready():
	AddGamesSensitivities()
	if DataManager.get_data("sensitivity"):
		sensitivity.text = str(DataManager.get_data("sensitivity"))
	if DataManager.get_data("sensitivity_game"):
		game.selected = DataManager.get_data("sensitivity_game")

func AddGamesSensitivities():
	for sens in games_sensitivities:
		game.add_item(sens)

func _on_sensitivity_text_changed(new_text):
	DataManager.save_data("sensitivity_game", game.get_selected_id())
	DataManager.save_data("sensitivity_game_value", games_sensitivities.get(game.get_item_text(game.get_selected_id())))
	DataManager.save_data("sensitivity", float(new_text))

func _on_game_item_selected(index):
	DataManager.save_data("sensitivity_game", index)
	DataManager.save_data("sensitivity_game_value", games_sensitivities.get(game.get_item_text(index)))