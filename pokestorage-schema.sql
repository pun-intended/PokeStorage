CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE monsters (
    num INTEGER PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    gen INTEGER
);

CREATE TABLE types (
    type VARCHAR(15) PRIMARY KEY
);

CREATE TABLE moves (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    type VARCHAR(15) REFERENCES types(type) ON DELETE SET NULL
);

CREATE TABLE has_type (
    num INTEGER REFERENCES monsters(num) ON DELETE CASCADE,
    type VARCHAR(15) REFERENCES types(type) ON DELETE SET NULL,
    PRIMARY KEY (num, type)
);

CREATE TABLE user_monsters (
    id SERIAL PRIMARY KEY,
    num INTEGER REFERENCES monsters(num) ON DELETE CASCADE,
    nickname VARCHAR(30),
    atk_iv INTEGER,
    def_iv INTEGER,
    hp_iv INTEGER,
    cp INTEGER
);

CREATE TABLE has_move (
    user_monster_id INTEGER REFERENCES user_monsters(id) ON DELETE CASCADE,
    move_id INTEGER REFERENCES moves(id) ON DELETE CASCADE,
    PRIMARY KEY (user_monster_id, move_id)
);

CREATE TABLE can_use (
    monster_num INTEGER REFERENCES monsters(num) ON DELETE CASCADE,
    move_id INTEGER REFERENCES moves(id) ON DELETE CASCADE,
    is_elite BOOLEAN NOT NULL DEFAULT 'false',
    PRIMARY KEY(monster_num, move_id)
);

