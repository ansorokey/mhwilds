-- SEE MONSTERS AND THEIR HABITATS
SELECT large_monsters.*, locales.name from large_monsters 
JOIN monster_locales
ON large_monsters.id = monster_locales.monsterId
JOIN locales
ON locales.id = monster_locales.localeId;

-- SELECT MONSTERS AND THEIR PARTS AND PART WEAKNESSES
SELECT 
    large_monsters.*, 
    monster_hide_parts.name,
    damage_types.name,
    monster_damage_effects.effectiveness
FROM large_monsters JOIN monster_hide_parts
ON large_monsters.id = monster_hide_parts.monsterId
JOIN monster_damage_effects
ON monster_damage_effects.monsterHidePartId = monster_hide_parts.id
JOIN damage_types
ON damage_types.id = monster_damage_effects.damageId;    


