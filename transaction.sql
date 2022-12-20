BEGIN;
  INSERT INTO users (custom_data) VALUES ('{"name": "morette"}');
  UPDATE users SET custom_data = '{"name": "kidding"}';
SAVEPOINT morette;
  INSERT INTO users (custom_data) VALUES ('{"name": "after savepoint"}');
COMMIT;

BEGIN;
  CREATE TABLE IF NOT EXISTS cities (
    id_city SERIAL,
    street VARCHAR(100),
    str_number VARCHAR(10)
  );

  INSERT INTO cities (street, str_number) VALUES ('nine street', '2000');
  INSERT INTO cities (street, str_number) VALUES ('five street', '12');
  INSERT INTO cities (street, str_number) VALUES ('three street', '981');
  INSERT INTO cities (street, str_number) VALUES ('three2 street', '981');
COMMIT;
