feature 'viewing bookmarks' do
  scenario 'should present all existing bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.twitter.com"
  end
end
