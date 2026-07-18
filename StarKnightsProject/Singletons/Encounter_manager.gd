class_name EncounterManager
extends Node

# The class in charge of actually kicking a battle off: turns an Encounter
# (which enemies, plus any extra rules) into a live battle by building fresh
# enemy instances, handing the persistent roster + those enemies to
# BattleManager, then applying the encounter's conditions.
func start_encounter(encounter: Encounter) -> void:
	var enemies: Array[EnemyCombatent] = []

	for enemy_name in encounter.enemy_names:
		var enemy := enemy_database.create_enemy(enemy_name)
		if enemy:
			enemies.append(enemy)

	battle_manager.start_battle(party_manager.characters, enemies)

	for condition in encounter.conditions:
		condition.apply()
