require 'rails_helper'

describe 'user visiting home page' do
  it 'can create new user account by filling in a form' do
   username = "funbucket13"
   visit '/'

   click_on "Sign Up"

   expect(current_path).to eq(new_user_path)

   fill_in :user_username, with: username
   fill_in :user_password, with: "test"

   click_on "Create User"

   expect(page).to have_content("Welcome, #{username}!")
  end
  it 'can log in by cliccking the link i already have an account' do
    user = User.create(username: "funbucket13", password: "test")

    visit '/'

    click_on "I already have an account"

    expect(current_path).to eq(login_path)
    fill_in "username", with: user.username
    fill_in "password", with: user.password

    click_on "Log In"

    expect(current_path).to eq(user_path(user))

    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Log out")
  end
end
