require_relative './web_helper.rb'

feature 'delete bookmark' do
  scenario 'removes bookmark from the database' do
    add_a_bookmark
    first('.bookmark').click_button('Delete') #.bookmark represents the class
    expect(page).not_to have_content('Sinatra')
    expect(page).not_to have_content('TestTitle')
  end
end
