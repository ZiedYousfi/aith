-- sqlite schema for version 1
PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS aith_db_manager (
  db_version INTEGER PRIMARY KEY NOT NULL
);

INSERT OR IGNORE INTO aith_db_manager (db_version) VALUES (1);

CREATE TABLE IF NOT EXISTS user (
  uuid text PRIMARY KEY NOT NULL,
  username text UNIQUE NOT NULL,
  infos text,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_username ON user (username);

CREATE TABLE IF NOT EXISTS conversation (
  id INTEGER PRIMARY KEY NOT NULL,
  user_id INTEGER NOT NULL,
  conversation_type TEXT NOT NULL, -- "signup" or "login"
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(uuid) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_user_id ON conversation (user_id);

CREATE TABLE IF NOT EXISTS message (
  id INTEGER PRIMARY KEY NOT NULL,
  conversation_id INTEGER NOT NULL,
  role TEXT NOT NULL, -- "user" or "assistant"
  content TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  FOREIGN KEY (conversation_id) REFERENCES conversation(id) ON DELETE CASCADE
);

COMMIT;

-- end of V1.sql
