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

INSERT INTO monster_parts (name, monsterId, sharp, blunt, ranged, fire, water, thunder, ice, dragon) VALUES
(
    'Head',
    (SELECT id from large_monsters WHERE name = 'Chatacabra'),
    4, 4, 4, 1, 1, 2, 1, 0
),(
    'Tongue',
    (SELECT id from large_monsters WHERE name = 'Chatacabra'),
    4, 4, 4, 1, 1, 2, 1, 0
),(
    'Torso',
    (SELECT id from large_monsters WHERE name = 'Chatacabra'),
    4, 4, 4, 1, 1, 2, 1, 0
);