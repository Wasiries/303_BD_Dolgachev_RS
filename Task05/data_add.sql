PRAGMA foreign_keys = ON;

INSERT INTO users (first_name, last_name, email, gender, register_date, occupation_id)
VALUES ('Роман', 'Долгачёв', 'dolgachev_roman@example.com', 'male', date('now'),
        (SELECT id FROM occupations WHERE name = 'student'));
INSERT INTO users (first_name, last_name, email, gender, register_date, occupation_id)
VALUES ('Валерия', 'Житина', 'zhitina_valeria@example.com', 'female', date('now'),
        (SELECT id FROM occupations WHERE name = 'student'));
INSERT INTO users (first_name, last_name, email, gender, register_date, occupation_id)
VALUES ('Вячеслав', 'Иванов', 'ivanov_vyacheslav@example.com', 'male', date('now'),
        (SELECT id FROM occupations WHERE name = 'student'));
INSERT INTO users (first_name, last_name, email, gender, register_date, occupation_id)
VALUES ('Ульяна', 'Игнатьева', 'ignatyeva_ulyana@example.com', 'female', date('now'),
        (SELECT id FROM occupations WHERE name = 'student'));
INSERT INTO users (first_name, last_name, email, gender, register_date, occupation_id)
VALUES ('Анастасия', 'Исак', 'isak_anastasia@example.com', 'female', date('now'),
        (SELECT id FROM occupations WHERE name = 'student'));

INSERT INTO movies (title, year) VALUES ('Interstellar', 2014);
INSERT INTO movies (title, year) VALUES ('Pulp Fiction', 1994);
INSERT INTO movies (title, year) VALUES ('Zootopia', 2016);

INSERT INTO movie_genres (movie_id, genre_id)
SELECT m.id, g.id FROM movies m, genres g
WHERE m.title = 'Interstellar' AND m.year = 2014 AND g.name IN ('Sci-Fi', 'Adventure', 'Drama');

INSERT INTO movie_genres (movie_id, genre_id)
SELECT m.id, g.id FROM movies m, genres g
WHERE m.title = 'Pulp Fiction' AND m.year = 1994 AND g.name IN ('Comedy', 'Crime', 'Drama', 'Thriller');

INSERT INTO movie_genres (movie_id, genre_id)
SELECT m.id, g.id FROM movies m, genres g
WHERE m.title = 'Zootopia' AND m.year = 2016 AND g.name IN ('Animation', 'Children', 'Comedy');

INSERT INTO ratings (user_id, movie_id, rating)
VALUES ((SELECT id FROM users WHERE email = 'dolgachev_roman@example.com'),
        (SELECT id FROM movies WHERE title = 'Interstellar' AND year = 2014), 5);

INSERT INTO ratings (user_id, movie_id, rating)
VALUES ((SELECT id FROM users WHERE email = 'dolgachev_roman@example.com'),
        (SELECT id FROM movies WHERE title = 'Pulp Fiction' AND year = 1994), 5);

INSERT INTO ratings (user_id, movie_id, rating)
VALUES ((SELECT id FROM users WHERE email = 'dolgachev_roman@example.com'),
        (SELECT id FROM movies WHERE title = 'Zootopia' AND year = 2016), 4);
