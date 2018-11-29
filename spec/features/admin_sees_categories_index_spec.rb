require 'rails_helper'

describe 'user visits article index page' do
  context 'as admin' do
    it ' allows admin to see all articles' do
      admin = User.create(username: 'manoj', password: 'mypassword', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_articles_path
      expect(page).to have_content('Admin Articles')
    end
  end
end
