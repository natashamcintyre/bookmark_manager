CREATE TABLE bookmarktags(id SERIAL PRIMARY KEY, bookmark_id INT, FOREIGN KEY(bookmark_id) REFERENCES bookmarks(id), tag_id INT, FOREIGN KEY(tag_id) REFERENCES tags(id));
