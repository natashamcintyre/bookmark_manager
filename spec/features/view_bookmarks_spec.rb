feature 'viewing bookmarks' do
  scenario 'should present all existing bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "www."
  end
end
