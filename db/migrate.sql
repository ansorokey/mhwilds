DROP TABLE IF EXISTS large_monsters;
CREATE TABLE "large_monsters" (
  "monsterId" int NOT NULL PRIMARY KEY,
  "name" varchar,
  "type" varchar,
  "characteristics" varchar,
  "helpfulHints" varchar
);

DROP TABLE IF EXISTS locales;
CREATE TABLE "locales" (
  "localeId" int NOT NULL PRIMARY KEY,
  "name" varchar
);

DROP TABLE IF EXISTS monster_locales;
CREATE TABLE "monster_locales" (
  "monsterLocaleId" int NOT NULL PRIMARY KEY,
  "monsterId" int,
  "localeId" int,
  FOREIGN KEY("monsterId") REFERENCES "large_monsters"("monsterId"),
  FOREIGN KEY("localeId") REFERENCES "locales"("localeId")
);

DROP TABLE IF EXISTS monster_attacks;
CREATE TABLE "monster_attacks" (
  "monsterAttackId" int NOT NULL PRIMARY KEY,
  "monsterId" int,
  "specialAttackId" int,
  FOREIGN KEY ("monsterId") REFERENCES "large_monsters"("monsterId"),
  FOREIGN KEY ("specialAttackId") REFERENCES "special_attack_types"("attackId")
);

DROP TABLE IF EXISTS special_attack_types;
CREATE TABLE "special_attack_types" (
  "attackId" int NOT NULL PRIMARY KEY,
  "name" varchar
);

DROP TABLE IF EXISTS damage_types;
CREATE TABLE "damage_types" (
  "damageTypeId" int NOT NULL PRIMARY KEY,
  "name" varchar
);

DROP TABLE IF EXISTS status_types;
CREATE TABLE "status_types" (
  "statusId" int NOT NULL PRIMARY KEY,
  "name" varchar
);

DROP TABLE IF EXISTS monster_hide_parts;
CREATE TABLE "monster_hide_parts" (
  "monsterHidePartId" int NOT NULL PRIMARY KEY,
  "name" varchar,
  "monsterId" int,
  FOREIGN KEY ("monsterId") REFERENCES "large_monsters"("monsterId")
);

DROP TABLE IF EXISTS hunting_items;
CREATE TABLE "hunting_items" (
  "itemId" int NOT NULL PRIMARY KEY,
  "name" varchar
);

DROP TABLE IF EXISTS monster_item_effects;
CREATE TABLE "monster_item_effects" (
  "monsterItemId" int NOT NULL PRIMARY KEY,
  "monsterId" int,
  "itemId" int,
  FOREIGN KEY ("monsterId") REFERENCES "large_monsters"("monsterId"),
  FOREIGN KEY ("itemId") REFERENCES "hunting_items"("itemId")
);

