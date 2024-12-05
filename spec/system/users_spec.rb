require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe "Registration Testing" do
    context "new user with correct information" do
      it "allows a user to sign up" do
        visit new_user_registration_path
        fill_in "Username", with: "Capybara"
        fill_in "Email", with: "cr@msudenver.edu"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button "Sign up"
        expect(page).to have_content("Welcome! You have signed up successfully.")
      end
    end
  end

  describe "User Editing Testing" do
    context "new user with correct information" do
      it "allows a user to edit profile" do
        visit new_user_registration_path
        fill_in "Username", with: "Capybara"
        fill_in "Email", with: "cr@msudenver.edu"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button "Sign up"
        click_link "Edit Profile"
        fill_in "Username", with: "Fixed"
        fill_in "Bio", with: "Bio Fixed"
        click_button "Update Profile"
        expect(page).to have_content("User was successfully updated.")
      end
    end
  end

  describe "Log in and Sign up Replaced" do
    context "new user with correct information" do
      let(:user) { FactoryBot.create(:user, username: "testuser", email: "user1@msudenver.edu", password: "password") }

      it "Buttons have been replaced" do
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
        expect(page).to have_selector("input.sign-out-link[value='Sign Out']")
        click_link "Back to For You"
        expect(page).to have_selector("input.sign-out-link[value='Sign Out']")
      end
    end
  end

  describe "Creating a new post" do
    context "logged in user" do
      let(:user) { FactoryBot.create(:user, email: "user1@msudenver.edu", password: "password") }

      it "allows a user to create a new post" do
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
        click_link "New Post"
        click_link "New Post"
        fill_in "feed_item_body", with: "Test making"
        fill_in "feed_item_likes", with: "45"
        click_button "Save"
        click_link "Back to Profile"
        click_link "Back to For You"
        expect(page).to have_content("Test making")
      end
    end
  end
end