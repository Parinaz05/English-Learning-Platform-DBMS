-- ==========================================================
-- DATABASE: Dynamic Language Learning Tool
-- Create Database
CREATE DATABASE IF NOT EXISTS language_learning_db;
USE language_learning_db;

-- Drop existing tables (for re-run convenience)
DROP TABLE IF EXISTS lesson_history;
DROP TABLE IF EXISTS user_progress;
DROP TABLE IF EXISTS grammar_rules;
DROP TABLE IF EXISTS vocabulary;
DROP TABLE IF EXISTS users;

-- 1. USERS TABLE
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    date_joined DATE DEFAULT (CURRENT_DATE)
);

-- 2. VOCABULARY TABLE
CREATE TABLE vocabulary (
    vocab_id INT AUTO_INCREMENT PRIMARY KEY,
    word VARCHAR(50) NOT NULL,
    definition TEXT,
    part_of_speech ENUM('noun', 'verb', 'adjective', 
    'adverb', 'preposition', 'conjunction', 'pronoun'),
    example_sentence TEXT
);

-- 3. GRAMMAR RULES TABLE
CREATE TABLE grammar_rules (
    rule_id INT AUTO_INCREMENT PRIMARY KEY,
    rule_name VARCHAR(100) NOT NULL,
    description TEXT,
    pattern_example TEXT
);

-- 4. USER PROGRESS TABLE
CREATE TABLE user_progress (
    progress_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    vocab_id INT,
    rule_id INT,
    question_type ENUM('vocabulary', 'grammar'),
    is_correct BOOLEAN,
    attempt_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (vocab_id) REFERENCES vocabulary(vocab_id),
    FOREIGN KEY (rule_id) REFERENCES grammar_rules(rule_id)
);

-- 5. LESSON HISTORY TABLE
CREATE TABLE lesson_history (
    lesson_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    generated_sentence TEXT,
    focus_area ENUM('vocabulary', 'grammar'),
    performance_summary TEXT,
    lesson_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

select * from users;
select * from vocabulary;
select * from grammar_rules;
select * from user_progress;
select * from lesson_history; 

-- DATA INSERTION

INSERT INTO users (username, email, date_joined)
VALUES
('alice', 'alice@example.com', '2025-01-12'),
('bob', 'bob@example.com', '2025-01-15'),
('carol', 'carol@example.com', '2025-02-05'),
('david', 'david@example.com', '2025-02-10'),
('emma', 'emma@example.com', '2025-03-01'),
('frank', 'frank@example.com', '2025-03-15'),
('grace', 'grace@example.com', '2025-04-02'),
('henry', 'henry@example.com', '2025-04-12'),
('isabel', 'isabel@example.com', '2025-05-10'),
('jack', 'jack@example.com', '2025-05-25');

INSERT INTO vocabulary (word, definition, part_of_speech, example_sentence)
VALUES
('apple', 'A round fruit with red or green skin.', 'noun', 'She ate a juicy apple.'),
('run', 'To move swiftly on foot.', 'verb', 'He runs every morning.'),
('beautiful', 'Pleasing the senses or mind aesthetically.', 'adjective', 'The garden is beautiful in spring.'),
('quickly', 'At a fast speed; rapidly.', 'adverb', 'He finished the task quickly.'),
('book', 'A written or printed work consisting of pages.', 'noun', 'She borrowed a book from the library.'),
('believe', 'To accept something as true.', 'verb', 'They believe in honesty.'),
('curious', 'Eager to know or learn something.', 'adjective', 'The child was curious about stars.'),
('softly', 'In a gentle and quiet way.', 'adverb', 'She spoke softly to calm him down.'),
('mountain', 'A large natural elevation of the earth’s surface.', 'noun', 'They climbed a tall mountain.'),
('explore', 'To travel through an area to learn about it.', 'verb', 'We explored the ancient ruins.'),
('happy', 'Feeling or showing pleasure.', 'adjective', 'She felt happy about her results.'),
('brightly', 'With much light or color.', 'adverb', 'The stars shone brightly.'),
('teacher', 'A person who teaches.', 'noun', 'The teacher explained the lesson.'),
('write', 'To form letters or words on a surface.', 'verb', 'He likes to write stories.'),
('careful', 'Making sure to avoid potential danger or mistakes.', 'adjective', 'Be careful with the glass.'),
('slowly', 'At a low speed.', 'adverb', 'He walked slowly across the road.');

INSERT INTO grammar_rules (rule_name, description, pattern_example)
VALUES
('Simple Present Tense', 'Used to express habitual actions or general truths.', 'She reads every day.'),
('Past Continuous Tense', 'Describes an ongoing action in the past.', 'They were playing football.'),
('Future Perfect Tense', 'Action that will be completed before a specified time in the future.', 'I will have finished by 5 PM.'),
('Articles', 'Used before nouns to specify definiteness (a, an, the).', 'She bought an apple.'),
('Modal Verbs', 'Used to express ability, permission, or possibility.', 'He can swim.'),
('Comparatives', 'Used to compare two things.', 'This car is faster than that one.'),
('Superlatives', 'Used to show the highest degree of something.', 'He is the tallest boy in the class.'),
('Passive Voice', 'Object of the active sentence becomes the subject.', 'The cake was baked by Mary.'),
('Conditionals', 'Used to express conditions or hypothetical situations.', 'If it rains, we will stay home.'),
('Prepositions of Time', 'Used to indicate time relations.', 'I will meet you at 6 PM.');

INSERT INTO user_progress (user_id, vocab_id, rule_id, question_type, is_correct, attempt_date)
VALUES
(1, 1, 1, 'vocabulary', TRUE, '2025-10-10 10:00:00'),
(1, 2, 2, 'grammar', FALSE, '2025-10-11 09:30:00'),
(2, 3, 3, 'vocabulary', TRUE, '2025-10-12 11:15:00'),
(2, 4, 4, 'grammar', TRUE, '2025-10-13 08:45:00'),
(3, 5, 5, 'vocabulary', FALSE, '2025-10-14 14:20:00'),
(3, 6, 6, 'grammar', TRUE, '2025-10-15 15:00:00'),
(4, 7, 7, 'vocabulary', TRUE, '2025-10-16 10:30:00'),
(4, 8, 8, 'grammar', TRUE, '2025-10-17 12:00:00'),
(5, 9, 9, 'vocabulary', FALSE, '2025-10-18 09:50:00'),
(5, 10, 10, 'grammar', TRUE, '2025-10-19 10:10:00'),
(6, 11, 1, 'vocabulary', TRUE, '2025-10-20 11:25:00'),
(6, 12, 2, 'grammar', FALSE, '2025-10-21 12:40:00'),
(7, 13, 3, 'vocabulary', TRUE, '2025-10-22 10:00:00'),
(7, 14, 4, 'grammar', TRUE, '2025-10-23 09:00:00'),
(8, 15, 5, 'vocabulary', FALSE, '2025-10-24 11:35:00'),
(8, 16, 6, 'grammar', TRUE, '2025-10-25 13:10:00'),
(9, 2, 7, 'vocabulary', TRUE, '2025-10-26 15:00:00'),
(9, 4, 8, 'grammar', FALSE, '2025-10-27 16:20:00'),
(10, 6, 9, 'vocabulary', TRUE, '2025-10-28 17:00:00'),
(10, 8, 10, 'grammar', TRUE, '2025-10-28 17:30:00');

INSERT INTO lesson_history (user_id, generated_sentence, focus_area, performance_summary, lesson_date)
VALUES
(1, 'She reads a book every morning.', 'vocabulary', 'Good understanding of nouns and verbs.', '2025-10-10 11:00:00'),
(2, 'They were playing football.', 'grammar', 'Needs improvement in tense recognition.', '2025-10-12 12:00:00'),
(3, 'I will have finished by tomorrow.', 'grammar', 'Understood future perfect usage.', '2025-10-14 14:30:00'),
(4, 'She bought an apple.', 'vocabulary', 'Correct use of articles.', '2025-10-16 13:00:00'),
(5, 'This car is faster than that one.', 'grammar', 'Good grasp of comparatives.', '2025-10-18 09:45:00'),
(6, 'He can swim well.', 'grammar', 'Strong with modal verbs.', '2025-10-20 10:30:00'),
(7, 'The cake was baked by Mary.', 'grammar', 'Improved in passive voice structure.', '2025-10-22 15:10:00'),
(8, 'If it rains, we will stay home.', 'grammar', 'Excellent with conditionals.', '2025-10-24 16:00:00'),
(9, 'I will meet you at 6 PM.', 'grammar', 'Understood prepositions of time.', '2025-10-26 17:00:00'),
(10, 'She spoke softly to calm him down.', 'vocabulary', 'Improved adverb usage.', '2025-10-28 18:00:00');

--  Display all grammar rules and their examples
SELECT rule_id, rule_name, pattern_example 
FROM grammar_rules;

--  List all user progress entries with joined details
SELECT up.progress_id, u.username, v.word, g.rule_name, 
up.question_type, up.is_correct, up.attempt_date
FROM user_progress up
LEFT JOIN users u ON up.user_id = u.user_id
LEFT JOIN vocabulary v ON up.vocab_id = v.vocab_id
LEFT JOIN grammar_rules g ON up.rule_id = g.rule_id
ORDER BY up.progress_id;

--  Show all correct answers of a specific user
SELECT progress_id, vocab_id, rule_id, question_type, is_correct, attempt_date
FROM user_progress
WHERE user_id = 1 AND is_correct = TRUE;

--  Count total questions attempted by each user
SELECT 
    u.username, 
    COUNT(up.progress_id) AS total_attempts
FROM user_progress up
JOIN users u ON up.user_id = u.user_id
GROUP BY u.username
ORDER BY total_attempts DESC;

--  Find users with highest accuracy
SELECT u.username,
ROUND(100 * SUM(CASE WHEN up.is_correct 
= TRUE THEN 1 ELSE 0 END) / COUNT(*), 2) AS accuracy_percent
FROM user_progress up
JOIN users u ON up.user_id = u.user_id
GROUP BY u.username
ORDER BY accuracy_percent DESC;

--  Fetch a user’s weak vocabulary areas
SELECT v.word, COUNT(*) AS incorrect_count
FROM user_progress up
JOIN vocabulary v ON up.vocab_id = v.vocab_id
WHERE up.user_id = 1 AND up.is_correct = FALSE
GROUP BY v.word
ORDER BY incorrect_count DESC;

--  Update user progress when a user improves
UPDATE User_Progress
SET is_correct = TRUE
WHERE progress_id = 2;


--  Show users who attempted more than 2 questions
SELECT u.username 
FROM users u
WHERE u.user_id IN (
    SELECT user_id FROM user_progress 
    GROUP BY user_id HAVING COUNT(*) > 2
);
--  Track user progress
SELECT u.username, v.word, g.rule_name, up.is_correct, up.attempt_date
FROM User_Progress up
JOIN Users u ON up.user_id = u.user_id
JOIN Vocabulary v ON up.vocab_id = v.vocab_id
JOIN Grammar_Rules g ON up.rule_id = g.rule_id;

--  Delete a vocabulary word
DELETE FROM Vocabulary
WHERE vocab_id = 2;

-- Delete a progress record
DELETE FROM user_progress
WHERE progress_id = 20;