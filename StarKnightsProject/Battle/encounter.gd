class_name Encounter
extends Resource

# Names looked up via EnemyDatabase.create_enemy() rather than instances, so
# one Encounter resource can be started more than once and each attempt
# gets fresh EnemyCombatent instances (own HP, own state) rather than reusing
# whatever's left of the last attempt.
@export var enemy_names: Array[String] = []

# Optional extra rules applied once when the battle starts.
@export var conditions: Array[BattleCondition] = []
