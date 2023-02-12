CREATE OR REPLACE VIEW ability_types_view AS
SELECT
    a.id,
    a.ability,
    (SELECT string_agg(t.type, ', ')
     FROM ability_types as at
     JOIN types as t ON at.type_id = t.id
     WHERE at.ability_id = a.id) AS types
FROM abilities as a;

-- Create a materialized view, using the `ability_types_view`as query.
CREATE MATERIALIZED VIEW IF NOT EXISTS ability_types_materialized_view AS
SELECT * FROM ability_types_view;

-- Query the materialized view
SELECT * FROM ability_types_materialized_view;

-- Add a new ability.
INSERT INTO abilities (ability) VALUES ('New Ability');