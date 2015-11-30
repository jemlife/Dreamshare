require 'rails_helper.rb'

feature 'Creating entries' do
  scenario 'can create a job' do
    visit '/'
    click_link 'New Dream'
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_button 'Create Entry'
    expect(page).to have_content('#coffeetime')
end

feature 'Uploading images' do
  scenario 'can upload an image' do
    visit '/'
    click_link 'New Dream'
    attach_file('Image', "spec/files/images/stars.jpg")
    click_button 'Upload'
    expect(page).to have_css("img[src*='stars.jpg']")
  end
end
end
