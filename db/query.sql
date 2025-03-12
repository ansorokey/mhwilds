SELECT large_monsters.*, locales.name from large_monsters 
JOIN monster_locales
ON large_monsters.monsterId = monster_locales.monsterId
JOIN locales
ON locales.localeId = monster_locales.localeId;