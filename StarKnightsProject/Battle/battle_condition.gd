class_name BattleCondition
extends Resource

# Optional extra rule attached to an Encounter (e.g. an enemy stat buff, an
# environmental effect, a special win/loss rule). Applied once, right after
# the battle starts. Mirrors StatusEffect's virtual-hook pattern.
func apply() -> void:
	pass
