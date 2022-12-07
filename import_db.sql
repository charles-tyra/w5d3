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
   question_id INTEGER NOT NULL,
   users_id INTEGER NOT NULL,
   reply_id INTEGER,
   body TEXT NOT NULL,

   FOREIGN KEY (reply_id) REFERENCES replies(id)
);