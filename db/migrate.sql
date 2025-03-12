DROP TABLE IF EXISTS large_monsters;
CREATE TABLE "large_monsters" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar UNIQUE,
  "type" varchar,
  "characteristics" varchar,
  "helpfulHints" varchar
);

DROP TABLE IF EXISTS locales;
CREATE TABLE "locales" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar UNIQUE
);

DROP TABLE IF EXISTS monster_locales;
CREATE TABLE "monster_locales" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "monsterId" int,
  "localeId" int,
  FOREIGN KEY("monsterId") REFERENCES "large_monsters"("id"),
  FOREIGN KEY("localeId") REFERENCES "locales"("id")
);
DROP TABLE IF EXISTS special_attack_types;
CREATE TABLE "special_attack_types" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar UNIQUE
);

DROP TABLE IF EXISTS monster_attacks;
CREATE TABLE "monster_attacks" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "monsterId" int,
  "specialAttackId" int,
  FOREIGN KEY ("monsterId") REFERENCES "large_monsters"("id"),
  FOREIGN KEY ("specialAttackId") REFERENCES "special_attack_types"("id")
);

DROP TABLE IF EXISTS damage_types;
CREATE TABLE "damage_types" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar UNIQUE
);

DROP TABLE IF EXISTS monster_hide_parts;
CREATE TABLE "monster_hide_parts" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" varchar,
    "monsterId" INTEGER,
    FOREIGN KEY ("monsterId") REFERENCES "large_monsters"("id")
);

DROP TABLE IF EXISTS monster_parts;
CREATE TABLE "monster_parts" (
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

DROP TABLE IF EXISTS status_types;
CREATE TABLE "status_types" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar UNIQUE
);

DROP TABLE IF EXISTS monster_hide_parts;
CREATE TABLE "monster_hide_parts" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar UNIQUE,
  "monsterId" int,
  FOREIGN KEY ("monsterId") REFERENCES "large_monsters"("id")
);

DROP TABLE IF EXISTS hunting_items;
CREATE TABLE "hunting_items" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar UNIQUE
);

DROP TABLE IF EXISTS monster_item_effects;
CREATE TABLE "monster_item_effects" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "monsterId" int,
  "itemId" int,
  FOREIGN KEY ("monsterId") REFERENCES "large_monsters"("id"),
  FOREIGN KEY ("itemId") REFERENCES "hunting_items"("id")
);

