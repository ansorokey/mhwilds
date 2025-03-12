DELETE FROM large_monsters;
DELETE FROM locales;
DELETE FROM monster_locales;

INSERT INTO large_monsters (name, type, characteristics, helpfulHints) VALUES (
    'Chatacabra',
    'Amphibian',
    'Characteristics go here',
    'Helpful hints go here'
);

INSERT INTO locales (name) VALUES (
    'Plains'
);

INSERT INTO monster_locales (monsterId, localeId) VALUES (
    (SELECT monsterId from large_monsters WHERE name = 'Chatacabra'),
    (SELECT localeId from locales WHERE name = 'Plains')
);