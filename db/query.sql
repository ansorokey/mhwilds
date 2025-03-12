-- SEE MONSTERS AND THEIR HABITATS
SELECT large_monsters.*, locales.name from large_monsters 
JOIN monster_locales
ON large_monsters.id = monster_locales.monsterId
JOIN locales
ON locales.id = monster_locales.localeId;

-- SELECT PARTS AND PART WEAKNESSES by monster
SELECT  
    monster_parts.*
FROM large_monsters JOIN monster_parts
ON large_monsters.id = monster_parts.monsterId
WHERE large_monsters.name = 'Chatacabra';
