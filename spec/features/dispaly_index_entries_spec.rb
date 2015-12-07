require 'rails_helper'

feature 'Index displays a list of entries' do
  scenario 'the index displays correct created job information' do
    job_one = create(:entry, content: "This is entry one")
    job_two = create(:entry, content: "This is entry two")

    visit '/'
    expect(page).to have_content("This is entry one")
    expect(page).to have_content("This is entry two")
  end
end
