class_name BattleManager
extends Node

var player_team: Array[Character] = []
var enemy_team: Array[EnemyCombatent] = []

var battle_active := false

# Plays when a battle is entered
func start_battle(players: Array[Character],enemies: Array[EnemyCombatent]) -> void:
	player_team = players
	enemy_team = enemies
	battle_active = true
	
	# Plays when battle ends
func end_battle() -> void:
	player_team.clear() # The player team will be updated to contain all the characters brought back, the characters will perhaps be stored with 0hp
	enemy_team.clear()
	battle_active = false




# Helper functions
func get_alive_enemies() -> Array[Combatent]:
	var alive: Array[Combatent] = []

	for enemy in enemy_team:
		if enemy != null and enemy.current_hp > 0:
			alive.append(enemy)

	return alive

func get_alive_combatents() -> Array[Combatent]:
	var alive: Array[Combatent] = []

	for enemy in enemy_team:
		if enemy != null and enemy.current_hp > 0:
			alive.append(enemy)
			
	for character in player_team:
		if character != null and character.current_hp > 0:
			alive.append(character)
	
	return alive
# Functions for gettting enemies

func get_front_enemies(count: int) -> Array[Combatent]:
	var targets: Array[Combatent] = []

	for enemy in enemy_team:
		if enemy.current_hp <= 0:
			continue

		targets.append(enemy)

		if targets.size() >= count:
			break

	return targets
	
func get_random_enemies(count: int) -> Array[Combatent]:
	var alive := get_alive_enemies()
	var targets: Array[Combatent] = []

	if alive.is_empty():
		return targets

	for i in range(count):
		targets.append(alive[randi() % alive.size()])

	return targets

func get_random_unique_enemies(count: int) -> Array[Combatent]:
	var pool := get_alive_enemies()
	var targets: Array[Combatent] = []

	if pool.is_empty():
		return targets

	count = min(count, pool.size())

	for i in range(count):
		var index := randi() % pool.size()

		targets.append(pool[index])
		pool.remove_at(index)

	return targets
