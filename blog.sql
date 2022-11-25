
-- Blog SQL
-- Creating the blog DATABASE
CREATE DATABASE IF NOT EXISTS Blog;

-- Creating Tables

-- Author Table

CREATE TABLE IF NOT EXISTS  Author (
    author_id INT AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    about TEXT,
    is_admin TINYINT(1),
    status TINYINT(1),
    date_registered DATETIME,
    password VARCHAR(255),
    PRIMARY KEY (account_id)
)

-- Posts Table
CREATE TABLE IF NOT EXISTS Posts (
    post_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    is_published TINYINT(1),
    date_published DATETIME,
    date_edited DATETIME,
    author_id INT NOT NULL,
    thumbnail VARCHAR(255) DEFAULT('thumbnail.png'),
    PRIMARY KEY (post_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
)

-- Comments Table
CREATE TABLE IF NOT EXISTS Comments (
    c_id INT AUTO_INCREMENT,
    post_id INT NOT NULL,
    comment TEXT,
    is_published TINYINT(1),
    date_published DATETIME,
    date_edited DATETIME,
    author_id INT NOT NULL,
    PRIMARY KEY (c_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id)
)

-- Replies Table
CREATE TABLE IF NOT EXISTS Replies (
    r_id INT AUTO_INCREMENT,
    c_id INT NOT NULL,
    reply TEXT,
    is_published TINYINT(1),
    date_published DATETIME,
    date_edited DATETIME,
    author_id INT NOT NULL,
    PRIMARY KEY (r_id),
    FOREIGN KEY (c_id) REFERENCES Comments(c_id)
)

-- PostLikes Table
CREATE TABLE IF NOT EXISTS PostLikes (
    like_id INT AUTO_INCREMENT,
    post_id INT NOT NULL,
    likes TINYINT(1),
    is_published TINYINT(1) DEFAULT('1'),
    date_published DATETIME,
    date_edited DATETIME,
    author_id INT NOT NULL,
    PRIMARY KEY (like_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id)
)


-- Perfoming Queries on Tables

-- All Posts
SELECT * FROM Posts;

-- Single Post
SELECT * FROM Posts WHERE post_id = post_id

-- Single Comment
SELECT * FROM Comments WHERE c_id = c_id

-- Single Replies
SELECT * FROM Replies WHERE r_id = r_id

-- Single PostLike
SELECT * FROM PostLikes WHERE like_id = like_id

-- All Posts by Author
SELECT * FROM Posts, Author WHERE Posts.author_id = Author.author_id

-- All Comments by Author
SELECT * FROM Comments, Author WHERE Comments.author_id = Author.author_id

-- All Replies by Author
SELECT * FROM Replies, Author WHERE Replies.author_id = Author.author_id

-- All Likes by Author
SELECT * FROM PostLikes, Author WHERE PostLikes.author_id = Author.author_id
