--- Database: pokemon_db

CREATE DATABASE pokemon_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'es_MX.UTF-8'
    LC_CTYPE = 'es_MX.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;



CREATE TABLE IF NOT EXISTS abilities (
    id SERIAL PRIMARY KEY,
    ability VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS pokemon (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    height NUMERIC(5, 2) NOT NULL,
    weight NUMERIC(5, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS types (
    id SERIAL PRIMARY KEY,
    type VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS pokemon_types (
    pokemon_id INTEGER REFERENCES pokemon(id),
    type_id INTEGER REFERENCES types(id),
    PRIMARY KEY (pokemon_id, type_id)
);

CREATE TABLE IF NOT EXISTS ability_types (
    ability_id INTEGER REFERENCES abilities(id),
    type_id INTEGER REFERENCES types(id),
    PRIMARY KEY (ability_id, type_id)
);

-- Example data
INSERT INTO abilities (ability)
VALUES ('Overgrow'), ('Blaze'), ('Torrent'), ('Solar Power'), ('Chlorophyll'), ('Flame Body'), ('Sturdy'), ('Levitate'), ('Water Absorb'), ('Lightning Rod');

INSERT INTO pokemon (name, height, weight)
VALUES 
('Bulbasaur', 0.71, 6.9), 
('Charmander', 0.61, 8.5), 
('Squirtle', 0.51, 9.0), 
('Venusaur', 2.01, 100.0), 
('Charizard', 1.7, 90.5);

INSERT INTO types (type)
VALUES ('Grass'), ('Fire'), ('Water'), ('Flying'), ('Steel'), ('Normal'), ('Psychic'), ('Electric'), ('Rock'), ('Poison');

INSERT INTO pokemon_types (pokemon_id, type_id)
VALUES 
((SELECT id FROM pokemon WHERE name = 'Bulbasaur'), (SELECT id FROM types WHERE type = 'Grass')), 
((SELECT id FROM pokemon WHERE name = 'Charmander'), (SELECT id FROM types WHERE type = 'Fire')), 
((SELECT id FROM pokemon WHERE name = 'Squirtle'), (SELECT id FROM types WHERE type = 'Water')), 
((SELECT id FROM pokemon WHERE name = 'Venusaur'), (SELECT id FROM types WHERE type = 'Grass')), 
((SELECT id FROM pokemon WHERE name = 'Venusaur'), (SELECT id FROM types WHERE type = 'Poison')),
((SELECT id FROM pokemon WHERE name = 'Charizard'), (SELECT id FROM types WHERE type = 'Fire')),
((SELECT id FROM pokemon WHERE name = 'Charizard'), (SELECT id FROM types WHERE type = 'Flying'))
ON CONFLICT DO NOTHING;

INSERT INTO ability_types (ability_id, type_id)
VALUES 
((SELECT id FROM abilities WHERE ability = 'Overgrow'), (SELECT id FROM types WHERE type = 'Grass')), 
((SELECT id FROM abilities WHERE ability = 'Blaze'), (SELECT id FROM types WHERE type = 'Fire')), 
((SELECT id FROM abilities WHERE ability = 'Torrent'), (SELECT id FROM types WHERE type = 'Water')), 
((SELECT id FROM abilities WHERE ability = 'Solar Power'), (SELECT id FROM types WHERE type = 'Fire')), 
((SELECT id FROM abilities WHERE ability = 'Chlorophyll'), (SELECT id FROM types WHERE type = 'Grass')),
((SELECT id FROM abilities WHERE ability = 'Flame Body'), (SELECT id FROM types WHERE type = 'Fire')),
((SELECT id FROM abilities WHERE ability = 'Flame Body'), (SELECT id FROM types WHERE type = 'Steel')),
((SELECT id FROM abilities WHERE ability = 'Sturdy'), (SELECT id FROM types WHERE type = 'Normal')),
((SELECT id FROM abilities WHERE ability = 'Sturdy'), (SELECT id FROM types WHERE type = 'Rock')),
((SELECT id FROM abilities WHERE ability = 'Levitate'), (SELECT id FROM types WHERE type = 'Flying')),
((SELECT id FROM abilities WHERE ability = 'Levitate'), (SELECT id FROM types WHERE type = 'Psychic')),
((SELECT id FROM abilities WHERE ability = 'Water Absorb'), (SELECT id FROM types WHERE type = 'Water')),
((SELECT id FROM abilities WHERE ability = 'Water Absorb'), (SELECT id FROM types WHERE type = 'Grass')),
((SELECT id FROM abilities WHERE ability = 'Lightning Rod'), (SELECT id FROM types WHERE type = 'Electric')),
((SELECT id FROM abilities WHERE ability = 'Lightning Rod'), (SELECT id FROM types WHERE type = 'Steel'))
ON CONFLICT DO NOTHING;


-- List all pokemon including it's types
SELECT
    p.id,
    p.name,
    p.height,
    p.weight,
    (SELECT string_agg(t.type, ', ')
     FROM pokemon_types as pt
     JOIN types as t ON pt.type_id = t.id
     WHERE pt.pokemon_id = p.id) AS types
FROM pokemon as p;

-- List all abilities including it's types
SELECT
    a.id,
    a.ability,
    (SELECT string_agg(t.type, ', ')
     FROM ability_types as at
     JOIN types as t ON at.type_id = t.id
     WHERE at.ability_id = a.id) AS types
FROM abilities as a;

select * from abilities;
select * from pokemon;
select * from types;