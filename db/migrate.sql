DROP TABLE IF EXISTS large_monsters;
CREATE TABLE "large_monsters" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar UNIQUE,
  "type" varchar,
  "characteristics" varchar,
  "helpfulHints" varchar
);

DROP TABLE IF EXISTS monster_locales;
CREATE TABLE "monster_locales" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "monsterId" int,
  'plains' BOOLEAN DEFAULT 0,
  'forest' BOOLEAN DEFAULT 0,
  'basin' BOOLEAN DEFAULT 0,
  'cliffs' BOOLEAN DEFAULT 0,
  'wyveria' BOOLEAN DEFAULT 0,
  FOREIGN KEY("monsterId") REFERENCES "large_monsters"("id")
);

DROP TABLE IF EXISTS hide_weaknesses;
CREATE TABLE "hide_weaknesses" (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name varchar,
    sharp INT DEFAULT 0,
    blunt INT DEFAULT 0,
    ranged INT DEFAULT 0,
    fire INT DEFAULT 0,
    water INT DEFAULT 0,
    thunder INT DEFAULT 0,
    ice INT DEFAULT 0,
    dragon INT DEFAULT 0,
    monsterId INTEGER,
    FOREIGN KEY ("monsterId") REFERENCES "large_monsters"("id")
);

DROP TABLE IF EXISTS status_effects;
CREATE TABLE "status_effects" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "monsterId" INTEGER,
  poison INTEGER DEFAULT 0,
  sleep INTEGER DEFAULT 0,
  paralysis INTEGER DEFAULT 0,
  blastblight INTEGER DEFAULT 0,
  stun INTEGER DEFAULT 0,
  exhaust INTEGER DEFAULT 0,
  FOREIGN KEY ("monsterId") REFERENCES "large_monsters"("id")
);

DROP TABLE IF EXISTS hunting_items;
CREATE TABLE "hunting_items" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "monsterId" INTEGER,
  flash_pods BOOLEAN DEFAULT 0,
  sonic_pods BOOLEAN DEFAULT 0,
  shock_traps BOOLEAN DEFAULT 0,
  pitfall_traps BOOLEAN DEFAULT 0,
  FOREIGN KEY ("monsterId") REFERENCES "large_monsters"("id")
);

