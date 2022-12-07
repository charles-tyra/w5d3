PRAGMA foreign_keys = ON;

CREATE TABLE users (
   id INTEGER PRIMARY KEY,
   fname TEXT NOT NULL,
   lname TEXT NOT NULL
);

CREATE TABLE questions (
   id INTEGER PRIMARY KEY,
   title TEXT NOT NULL,
   body TEXT NOT NULL,
   author_id INTEGER NOT NULL,

   FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
   users_id INTEGER NOT NULL,
   questions_id INTEGER NOT NULL
);

CREATE TABLE replies (
   id INTEGER PRIMARY KEY,
   questions_id INTEGER NOT NULL,
   users_id INTEGER NOT NULL,
   reply_id INTEGER,
   body TEXT NOT NULL,

   FOREIGN KEY (reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
   id INTEGER PRIMARY KEY,
   questions_id INTEGER NOT NULL,
   users_id INTEGER NOT NULL
);

INSERT INTO
   users (fname, lname)
VALUES
   ('Chad', 'Tyra'),
   ('Brett', 'Baker'),
   ('Darren', 'Walker'),
   ('Wing', 'Ling');


INSERT INTO
   questions (title, body, author_id)
VALUES
   ('Bananas?', 'How many bananas?', 1),
   ('Woke?', 'Are you woke?', 2);


INSERT INTO
   question_follows (users_id, questions_id)
VALUES
   (1,1),
   (2,2),
   (3,2);


INSERT INTO
   replies (questions_id, users_id, reply_id, body)
VALUES
   (1, 4, NULL, 'I do not like bananas, so this does not apply'),
   (1, 1, 1, 'you are a loser'),
   (1, 2, 2, 'that was mean, take it back'),
   (1, 2, 3, 'you cannot make me.');

INSERT INTO
   question_likes(questions_id, users_id)
VALUES
   (1, 1),
   (1, 2),
   (1, 3),
   (1, 4),
   (2, 1);
