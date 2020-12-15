### User Stories
```
As a User
So that I can keep track of my bookmarks
I want to be able to see a list of bookmarks
```
```
Given: that I have previously bookmarked sites
When: I want to view historic bookmarks
Then: the website should return a list of bookmarks
```


```
As a User
So that I can save a page for quick access
I want to be able to add a bookmark to the database
```
```
Given: that I have visited a useful page I want to revisit quickly
When: I want to store it
Then: the bookmark should be stored safely in the database
```

### Domain Model
User Story 1 Diagram:

![US1 Domain Diagram](https://github.com/chriswhitehouse/bookmark_manager/blob/main/diagrams/user_story_1_diagram.svg)

* Objects: user, bookmark, bookmark(list)

* Properties: name, url,

* Methods: see_list

|Class |User|
|-----|-----|
|Properties| name |
|Actions | see_name |

|Class | Bookmark |
|---|---|
|Properties | url, short_name, description |
|Actions|    |

|Class | BookmarkManager |
|-----|------|
|Properties | bookmark_list |
|Actions | see_list |

### Database Setup

1. Connect to psql
2. Create the database using the psql command `CREATE DATABASE bookmark_manager`;
3. Connect to the database using the pqsl command `\c` bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql

### Test Database Setup

1. Connect to psql
2. Use psql command 'CREATE DATABASE bookmark_manager_test'; to create a test database
3. Move into bookmark_manager_test and use psql command from                01_create_bookmarks_table.sql to create a test table.
