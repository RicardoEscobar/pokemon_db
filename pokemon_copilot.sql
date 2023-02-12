-- Create a PostgreSQL database to store pokemon moves.
CREATE DATABASE pokemon_moves
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'es_MX.UTF-8'
    LC_CTYPE = 'es_MX.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    TEMPLATE template0;

-- Create a table to store pokemon categories.
CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    category VARCHAR(100) NOT NULL
);

-- Create a table to store pokemon types.
CREATE TABLE IF NOT EXISTS types (
    id SERIAL PRIMARY KEY,
    type VARCHAR(100) NOT NULL,
    category_id INTEGER REFERENCES categories(id) on delete cascade on update cascade
);

-- Create a table to store pokemon moves.
CREATE TABLE IF NOT EXISTS moves (
    id SERIAL PRIMARY KEY,
    move VARCHAR(100) NOT NULL
);

-- Create a table to store relationship between pokemon types and moves.
CREATE TABLE IF NOT EXISTS types_moves (
    type_id INTEGER REFERENCES types(id) on delete cascade on update cascade,
    move_id INTEGER REFERENCES moves(id) on delete cascade on update cascade,
    PRIMARY KEY (type_id, move_id)
);

-- Insert data into categories table.
INSERT INTO categories (category) VALUES ('Physical'), ('Special'), ('Status');

-- Insert data into types table.
INSERT INTO types (type, category_id) VALUES ('Normal', 1), ('Fire', 1), ('Water', 1), ('Electric', 1), ('Grass', 1), ('Ice', 1), ('Fighting', 1), ('Poison', 1), ('Ground', 1), ('Flying', 1), ('Psychic', 1), ('Bug', 1), ('Rock', 1), ('Ghost', 1), ('Dragon', 1), ('Dark', 1), ('Steel', 1), ('Fairy', 1);

-- Insert data into moves table.
INSERT INTO moves (move) VALUES ('Pound'), ('Karate Chop'), ('Double Slap'), ('Comet Punch'), ('Mega Punch'), ('Pay Day'), ('Fire Punch'), ('Ice Punch'), ('Thunder Punch'), ('Scratch'), ('Vice Grip'), ('Guillotine'), ('Razor Wind'), ('Swords Dance'), ('Cut'), ('Gust'), ('Wing Attack'), ('Whirlwind'), ('Fly'), ('Bind'), ('Slam'), ('Vine Whip'), ('Stomp'), ('Double Kick'), ('Mega Kick'), ('Jump Kick'), ('Rolling Kick'), ('Sand Attack'), ('Headbutt'), ('Horn Attack'), ('Fury Attack'), ('Horn Drill'), ('Tackle'), ('Body Slam'), ('Wrap'), ('Take Down'), ('Thrash'), ('Double-Edge'), ('Tail Whip'), ('Poison Sting'), ('Twineedle'), ('Pin Missile'), ('Leer'), ('Bite'), ('Growl'), ('Roar'), ('Sing'), ('Supersonic'), ('Sonic Boom'), ('Disable'), ('Acid'), ('Ember'), ('Flamethrower'), ('Mist'), ('Water Gun'), ('Hydro Pump'), ('Surf'), ('Ice Beam'), ('Blizzard'), ('Psybeam'), ('Bubble Beam'), ('Aurora Beam'), ('Hyper Beam'), ('Peck'), ('Drill Peck'), ('Submission'), ('Low Kick'), ('Counter'), ('Seismic Toss'), ('Strength'), ('Absorb'), ('Mega Drain'), ('Leech Seed'), ('Growth'), ('Razor Leaf'), ('Solar Beam'), ('Poison Powder'), ('Stun Spore'), ('Sleep Powder'), ('Petal Dance'), ('String Shot'), ('Dragon Rage'), ('Fire Spin'), ('Thunder Shock'), ('Thunderbolt'), ('Thunder Wave'), ('Thunder'), ('Rock Throw'), ('Earthquake'), ('Fissure'), ('Dig'), ('Toxic'), ('Confusion'), ('Psychic'), ('Hypnosis'), ('Meditate'), ('Agility'), ('Quick Attack'), ('Rage'), ('Teleport'), ('Night Shade'), ('Mimic'), ('Screech'), ('Double Team'), ('Recover'), ('Harden'), ('Minimize'), ('Smokescreen'), ('Confuse Ray'), ('Withdraw'), ('Defense Curl'), ('Barrier'), ('Light Screen'), ('Haze'), ('Reflect'), ('Focus Energy'), ('Bide'), ('Metronome'), ('Mirror Move'), ('Self-Destruct'), ('Egg Bomb'), ('Lick'), ('Smog'), ('Sludge'), ('Bone Club'), ('Fire Blast'), ('Waterfall'), ('Clamp'), ('Swift'), ('Skull Bash'), ('Spike Cannon'), ('Constrict'), ('Amnesia'), ('Kinesis'), ('Soft-Boiled'), ('High Jump Kick'), ('Glare'), ('Dream Eater'), ('Poison Gas'), ('Barrage'), ('Leech Life'), ('Lovely Kiss'), ('Sky Attack'), ('Transform'), ('Bubble'), ('Dizzy Punch'), ('Spore'), ('Flash'), ('Psywave'), ('Splash'), ('Acid Armor'), ('Crabhammer'), ('Explosion'), ('Fury Swipes'), ('Bonemerang'), ('Rest'), ('Rock Slide'), ('Hyper Fang'), ('Sharpen'), ('Conversion'), ('Tri Attack'), ('Super Fang'), ('Slash'), ('Substitute'), ('Struggle');

-- Insert all normal moves data into types_moves table.
INSERT INTO types_moves (type_id, move_id) VALUES (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 9), (1, 10), (1, 11), (1, 12), (1, 13), (1, 14), (1, 15), (1, 16), (1, 17), (1, 18), (1, 19), (1, 20), (1, 21), (1, 22), (1, 23), (1, 24), (1, 25), (1, 26), (1, 27), (1, 28), (1, 29), (1, 30), (1, 31), (1, 32), (1, 33), (1, 34), (1, 35), (1, 36), (1, 37), (1, 38), (1, 39), (1, 40), (1, 41), (1, 42), (1, 43), (1, 44), (1, 45), (1, 46), (1, 47), (1, 48), (1, 49), (1, 50), (1, 51), (1, 52), (1, 53), (1, 54), (1, 55), (1, 56), (1, 57), (1, 58), (1, 59), (1, 60), (1, 61), (1, 62), (1, 63), (1, 64), (1, 65), (1, 66), (1, 67), (1, 68), (1, 69), (1, 70), (1, 71), (1, 72), (1, 73), (1, 74), (1, 75), (1, 76), (1, 77), (1, 78), (1, 79), (1, 80), (1, 81), (1, 82), (1, 83);

-- Insert all fire moves data into types_moves table.
INSERT INTO types_moves (type_id, move_id) VALUES (2, 7), (2, 8), (2, 28), (2, 29), (2, 30), (2, 31), (2, 32), (2, 33), (2, 34), (2, 35), (2, 36), (2, 37), (2, 38), (2, 39), (2, 40), (2, 41), (2, 42), (2, 43), (2, 44), (2, 45), (2, 46), (2, 47), (2, 48), (2, 49), (2, 50), (2, 51), (2, 52), (2, 53), (2, 54), (2, 55), (2, 56), (2, 57), (2, 58), (2, 59), (2, 60), (2, 61), (2, 62), (2, 63), (2, 64), (2, 65), (2, 66), (2, 67), (2, 68), (2, 69), (2, 70), (2, 71), (2, 72), (2, 73), (2, 74), (2, 75), (2, 76), (2, 77), (2, 78), (2, 79), (2, 80), (2, 81), (2, 82), (2, 83), (2, 84), (2, 85), (2, 86), (2, 87), (2, 88), (2, 89), (2, 90), (2, 91), (2, 92), (2, 93), (2, 94), (2, 95), (2, 96), (2, 97), (2, 98), (2, 99), (2, 100), (2, 101), (2, 102), (2, 103), (2, 104), (2, 105), (2, 106);

-- Insert all water moves data into types_moves table.
INSERT INTO types_moves (type_id, move_id) VALUES (3, 7), (3, 8), (3, 28), (3, 29), (3, 30), (3, 31), (3, 32), (3, 33), (3, 34), (3, 35), (3, 36), (3, 37), (3, 38), (3, 39), (3, 40), (3, 41), (3, 42), (3, 43), (3, 44), (3, 45), (3, 46), (3, 47), (3, 48), (3, 49), (3, 50), (3, 51), (3, 52), (3, 53), (3, 54), (3, 55), (3, 56), (3, 57), (3, 58), (3, 59), (3, 60), (3, 61), (3, 62), (3, 63), (3, 64), (3, 65), (3, 66), (3, 67), (3, 68), (3, 69), (3, 70), (3, 71), (3, 72), (3, 73), (3, 74), (3, 75), (3, 76), (3, 77), (3, 78), (3, 79), (3, 80), (3, 81), (3, 82), (3, 83), (3, 84), (3, 85), (3, 86), (3, 87), (3, 88), (3, 89), (3, 90), (3, 91), (3, 92), (3, 93), (3, 94), (3, 95), (3, 96), (3, 97), (3, 98), (3, 99), (3, 100), (3, 101), (3, 102), (3, 103), (3, 104), (3, 105), (3, 106);

-- Select all moves from the database, join with types_moves table to get the type_id, join with types table to get the type name, join with categories table to get the category name.
SELECT m.move, t.type, c.category
FROM moves as m
JOIN types_moves as tm ON m.id = tm.move_id
JOIN types as t ON tm.type_id = t.id
JOIN categories as c ON t.category_id = c.id
where move = 'Headbutt';

SELECT
    m.move,
    c.category,
    (SELECT string_agg(t.type, ', ')
        FROM types_moves as tm
        JOIN types as t ON tm.type_id = t.id
        WHERE tm.move_id = m.id) AS types
FROM moves as m
JOIN types_moves as tm ON m.id = tm.move_id
JOIN types as t ON tm.type_id = t.id
JOIN categories as c ON t.category_id = c.id
--where move = 'Headbutt'
GROUP BY m.id, c.category;