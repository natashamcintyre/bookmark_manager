feature 'viewing bookmarks' do
  scenario 'should present all existing bookmarks' do
    conn = PG.connect(dbname: 'bookmark_manager_test')

    conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
    conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.twitter.com');")
    conn.exec("INSERT INTO bookmarks (url) VALUES('http://destroyallsoftware.com');")

    visit('/bookmarks')
    
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.twitter.com"
    expect(page).to have_content "http://destroyallsoftware.com"
  end
end
