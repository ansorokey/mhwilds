DROP TABLE IF EXISTS large_monsters;
CREATE TABLE "large_monsters" (
  "monsterId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar,
  "type" varchar,
  "characteristics" varchar,
  "helpfulHints" varchar
);

DROP TABLE IF EXISTS locales;
CREATE TABLE "locales" (
  "localeId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar
);

DROP TABLE IF EXISTS monster_locales;
CREATE TABLE "monster_locales" (
  "monsterLocaleId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "monsterId" int,
  "localeId" int,
  FOREIGN KEY("monsterId") REFERENCES "large_monsters"("monsterId"),
  FOREIGN KEY("localeId") REFERENCES "locales"("localeId")
);

DROP TABLE IF EXISTS monster_attacks;
CREATE TABLE "monster_attacks" (
  "monsterAttackId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "monsterId" int,
  "specialAttackId" int,
  FOREIGN KEY ("monsterId") REFERENCES "large_monsters"("monsterId"),
  FOREIGN KEY ("specialAttackId") REFERENCES "special_attack_types"("attackId")
);

DROP TABLE IF EXISTS special_attack_types;
CREATE TABLE "special_attack_types" (
  "attackId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar
);

DROP TABLE IF EXISTS damage_types;
CREATE TABLE "damage_types" (
  "damageTypeId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar
);

DROP TABLE IF EXISTS status_types;
CREATE TABLE "status_types" (
  "statusId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar
);

DROP TABLE IF EXISTS monster_hide_parts;
CREATE TABLE "monster_hide_parts" (
  "monsterHidePartId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar,
  "monsterId" int,
  FOREIGN KEY ("monsterId") REFERENCES "large_monsters"("monsterId")
);

DROP TABLE IF EXISTS hunting_items;
CREATE TABLE "hunting_items" (
  "itemId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar
);

DROP TABLE IF EXISTS monster_item_effects;
CREATE TABLE "monster_item_effects" (
  "monsterItemId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "monsterId" int,
  "itemId" int,
  FOREIGN KEY ("monsterId") REFERENCES "large_monsters"("monsterId"),
  FOREIGN KEY ("itemId") REFERENCES "hunting_items"("itemId")
);

