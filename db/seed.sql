INSERT INTO large_monsters (name, type, characteristics, helpfulHints) VALUES (
    'Chatacabra',
    'Amphibian',
    'Characteristics go here',
    'Helpful hints go here'
);

INSERT INTO monster_locales (monsterId, plains, forest, basin, cliffs, wyveria) VALUES 
(
    (SELECT id from large_monsters WHERE name = 'Chatacabra'),
    1, 0, 0, 0, 0
);

INSERT INTO hide_weaknesses (name, monsterId, sharp, blunt, ranged, fire, water, thunder, ice, dragon) VALUES
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
    3, 3, 3, 1, 1, 2, 1, 0
);

INSERT INTO status_effects (monsterId, poison, sleep, paralysis, blastblight, stun, exhaust) VALUES
(
    (SELECT id from large_monsters WHERE name = 'Chatacabra'),
    3, 2, 3, 2, 3, 2
);

INSERT INTO hunting_items (monsterId, flash_pods, sonic_pods, shock_traps, pitfall_traps) VALUES
(
    (SELECT id from large_monsters WHERE name = 'Chatacabra'),
    1, 0, 1, 1
);