require 'rails_helper'

feature 'Index displays a list of entries' do
  scenario 'the index displays correct created job information' do
    job_one = create(:entry, content: "This is entry one")

    visit '/'
    expect(page).to have_content("This is entry one")
  end
end
