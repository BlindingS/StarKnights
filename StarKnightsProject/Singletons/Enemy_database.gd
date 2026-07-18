class_name EnemyDatabase
extends Node

# Same reasoning as CharacterDatabase: every enemy is its own class that
# configures its own stats and art in its own _init(). This is just a
# name -> class lookup.
func create_enemy(enemy_name: String) -> EnemyCombatent:
	match enemy_name:
		"Batrocity":
			return BatrocityEnemy.new()

	push_error("Enemy not found: " + enemy_name)
	return null
