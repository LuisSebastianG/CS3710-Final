require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:user, User.create!(username: "username1", email: "test@msudenver.edu", password: "password"))
    assign(:profile, Profile.new)
  end

  it "renders new profile form" do
    render
    expect(rendered).to have_selector("form[action='#{user_profiles_path(user_id: @user.id)}']")
  end
end