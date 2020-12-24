require_relative './web_helper.rb'

feature 'update a bookmark' do
  scenario 'takes user to update page' do
    add_a_bookmark
    first('.bookmark').click_button('Edit')
    expect(page).to have_button 'Update'
    expect(page).to have_field 'url'
    expect(page).to have_field 'title'
  end

  scenario 'updates the content of the database' do
    add_a_bookmark
    first('.bookmark').click_button('Edit')
    fill_in 'url', with: 'www.testurlupdated.com'
    fill_in 'title', with: 'TestTitleUpdated'
    click_button 'Update'
    expect(page).to have_content "TestTitleUpdated"
    expect(page).to_not have_content "Sinatra"
  end
end
