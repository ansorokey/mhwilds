INSERT INTO large_monsters (name, type, characteristics, helpfulHints) VALUES (
    'Chatacabra',
    'Amphibian',
    'Characteristics go here',
    'Helpful hints go here'
);

INSERT INTO locales (name) VALUES (
    'Plains'
);

INSERT INTO damage_types (name) VALUES
    ('Sharp'),
    ('Blunt'),
    ('Ranged'),
    ('Fire'),
    ('Water'),
    ('Thunder'),
    ('Ice'),
    ('Dragon');

INSERT INTO status_types (name) VALUES
    ('Poison'),
    ('Sleep'),
    ('Paralysis'),
    ('Blastblight'),
    ('Stun'),
    ('Exhaust');

INSERT INTO hunting_items (name) VALUES
    ('Flash Pod'),
    ('Sonic Bomb'),
    ('Shock Trap'),
    ('Pitfall Trap');

INSERT INTO monster_locales (monsterId, localeId) VALUES (
    (SELECT id from large_monsters WHERE name = 'Chatacabra'),
    (SELECT id from locales WHERE name = 'Plains')
);

INSERT INTO monster_hide_parts (name, monsterId) VALUES
(
    'Head',
    (SELECT id from large_monsters WHERE name = 'Chatacabra')
),(
    'Tongue',
    (SELECT id from large_monsters WHERE name = 'Chatacabra')
),(
    'Torso',
    (SELECT id from large_monsters WHERE name = 'Chatacabra')
);

INSERT INTO monster_damage_effects (monsterHidePartId, damageId, effectiveness) VALUES 
(
    (SELECT id from monster_hide_parts 
        WHERE monsterId = (SELECT id from large_monsters WHERE name = 'Chatacabra') 
        and name = "Head"),
    (SELECT id from damage_types WHERE name = 'Sharp'),
    4
),(
    (SELECT id from monster_hide_parts 
        WHERE monsterId = (SELECT id from large_monsters WHERE name = 'Chatacabra') 
        and name = "Head"),
    (SELECT id from damage_types WHERE name = 'Blunt'),
    4
),(
    (SELECT id from monster_hide_parts 
        WHERE monsterId = (SELECT id from large_monsters WHERE name = 'Chatacabra') 
        and name = "Head"),
    (SELECT id from damage_types WHERE name = 'Ranged'),
    4
),(
    (SELECT id from monster_hide_parts 
        WHERE monsterId = (SELECT id from large_monsters WHERE name = 'Chatacabra') 
        and name = "Head"),
    (SELECT id from damage_types WHERE name = 'Fire'),
    1
),(
    (SELECT id from monster_hide_parts 
        WHERE monsterId = (SELECT id from large_monsters WHERE name = 'Chatacabra') 
        and name = "Head"),
    (SELECT id from damage_types WHERE name = 'Water'),
    1
),(
    (SELECT id from monster_hide_parts 
        WHERE monsterId = (SELECT id from large_monsters WHERE name = 'Chatacabra') 
        and name = "Head"),
    (SELECT id from damage_types WHERE name = 'Thunder'),
    2
),(
    (SELECT id from monster_hide_parts 
        WHERE monsterId = (SELECT id from large_monsters WHERE name = 'Chatacabra') 
        and name = "Head"),
    (SELECT id from damage_types WHERE name = 'Ice'),
    1
),(
    (SELECT id from monster_hide_parts 
        WHERE monsterId = (SELECT id from large_monsters WHERE name = 'Chatacabra') 
        and name = "Head"),
    (SELECT id from damage_types WHERE name = 'Dragon'),
    0
);

UPDATE monster_damage_effects SET
    Sharp = 4,
    Blunt = 4,
    Ranged = 4,
    Fire = 1,
    Water = 1,
    Thunder = 2,
    Ice = 1
WHERE monsterId = (SELECT id FROM large_monsters WHERE name = 'Chatacabra')
AND name = "Tongue";