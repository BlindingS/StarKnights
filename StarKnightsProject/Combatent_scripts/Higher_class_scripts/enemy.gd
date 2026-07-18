class_name EnemyCombatent
extends Combatent

var attack_damage: int = 0

func setup(definition: Dictionary) -> void:
	super(definition)
	attack_damage = definition.get("attack_damage", attack_damage)

# Default behavior: hit whoever is at the front of the player's team.
# Override this per enemy once individual enemies need unique behavior.
func take_turn() -> void:
	card_effects.damage(battle_manager.get_front_characters(1), attack_damage)
