-- Optional relational schema for future authenticated deployments.
CREATE TABLE IF NOT EXISTS students (id TEXT PRIMARY KEY, display_name TEXT, created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS assessments (id TEXT PRIMARY KEY, student_id TEXT NOT NULL, answers_json TEXT NOT NULL, created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY(student_id) REFERENCES students(id));
CREATE TABLE IF NOT EXISTS career_records (id TEXT PRIMARY KEY, title TEXT NOT NULL, category TEXT NOT NULL, data_json TEXT NOT NULL, source_url TEXT, verified_at TEXT, record_status TEXT NOT NULL DEFAULT 'demo');
CREATE TABLE IF NOT EXISTS college_records (id TEXT PRIMARY KEY, name TEXT NOT NULL, data_json TEXT NOT NULL, official_url TEXT, source_url TEXT, verified_at TEXT, record_status TEXT NOT NULL DEFAULT 'demo');
CREATE TABLE IF NOT EXISTS roadmap_progress (id TEXT PRIMARY KEY, student_id TEXT NOT NULL, career_id TEXT NOT NULL, progress_json TEXT NOT NULL, updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY(student_id) REFERENCES students(id));
