require 'rails_helper'

RSpec.describe EntriesController, type: :controller do
  describe " GET index" do
    it 'assigns @entries' do
      entry = Entry.create
      get :index
      expect(response).to render_template("index")
    end
  end
end
