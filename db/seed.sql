INSERT INTO large_monsters (name) VALUES
    ('Testmon'),
    ('Chatacabra'),
    ('Quematrice'),
    ('Lala Barina'),
    ('Congalala'),
    ('Balahara'),
    ('Doshaguma'),
    ('Uth Duna'),
    ('Rompopolo'),
    ('Rey Dau'),
    ('Nerscylla'),
    ('Hirabami'),
    ('Ajarakan'),
    ('Nu Udra'),
    ('Guardian Doshaguma'),
    ('Guardian Rathalos'),
    ('Jin Dahaad'),
    ('Guardian Ebony Odogaron'),
    ('Xu Wu'),
    ('Guardian Arkveld'),
    ('Zoh Shia'),
    ('Guardian Fulgur Anjanath'),
    ('Yian Kut-Ku'),
    ('Gypceros'),
    ('Rathian'),
    ('Rathalos'),
    ('Gravios'),
    ('Blangonga'),
    ('Gore Magala'),
    ('Arkveld');

UPDATE large_monsters SET
    type='Amphibian',
    characteristics='This is just a big ol test',
    helpfulHints='This should be seen on the second page'
WHERE name = 'Testmon';

INSERT INTO monster_locales (monsterId, plains, forest, basin, cliffs, wyveria) VALUES 
(
    (SELECT id from large_monsters WHERE name = 'Testmon'),
    1, 1, 1, 1, 1
),(
    (SELECT id from large_monsters WHERE name = 'Chatacabra'),
    1, 0, 0, 0, 0
);

INSERT INTO hide_weaknesses (name, monsterId, sharp, blunt, ranged, fire, water, thunder, ice, dragon) VALUES
(
    'Head',
    (SELECT id from large_monsters WHERE name = 'Testmon'),
    4, 3, 2, 1, 2, 3, 4, 0
),(
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
    (SELECT id from large_monsters WHERE name = 'Testmon'),
    3, 2, 1, 0, 1, 2
),(
    (SELECT id from large_monsters WHERE name = 'Chatacabra'),
    3, 2, 3, 2, 3, 2
);

INSERT INTO hunting_items (monsterId, flash_pods, sonic_pods, shock_traps, pitfall_traps) VALUES
(
    (SELECT id from large_monsters WHERE name = 'Testmon'),
    1, 0, 1, 0
),(
    (SELECT id from large_monsters WHERE name = 'Chatacabra'),
    1, 0, 1, 1
);

INSERT INTO monster_rewards (monsterId, name, description, rarity, value, rank, frequency) VALUES
(
    (SELECT id from large_monsters WHERE name = 'Testmon'),
    'Testmon Scale',
    'A piece of Testmon''s hide',
    6,
    1700,
    'low',
    4
),(
    (SELECT id from large_monsters WHERE name = 'Chatacabra'),
    'Chatacabra Carapace',
    'Description goes here',
    6,
    1700,
    'low',
    4
);

INSERT INTO recommended_elements (monsterId, fire, water, thunder, ice, dragon) VALUES 
(
    (SELECT id FROM large_monsters WHERE name='Testmon'),
    1, 1, 1, 1, 0
);