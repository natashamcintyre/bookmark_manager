### User Stories
    nouns in **bold**
    actions in *italics*

    As a **User**
    So that I can keep track of my bookmarks
    I want to be able to *see a list* of **bookmarks**

    **Given** that I have previously bookmarked sites
    **When** I want to view historic bookmarks
    **Then** the website should return a list of bookmarks

### Domain Model
Objects: user, bookmark, bookmark(list)
Properties: name, url,
Methods: see_list

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
