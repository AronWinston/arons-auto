CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    email TEXT,
    car VARCHAR(50),
    date_created timestamp DEFAULT current_timestamp
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER references users(id) ON DELETE CASCADE,
    post_username VARCHAR(50),
    comment VARCHAR(255),
    date_created timestamp DEFAULT current_timestamp
);