require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @user = User.create!(username: "username1", email: "test@msudenver.edu", password: "password")
    @profile = assign(:profile, Profile.create!(bio: "My bio", user: @user))
  end

  it "renders the edit profile form" do
    render
    expect(rendered).to have_selector("form[action='#{user_profile_path(user_id: @user.id, id: @profile.id)}']")
  end
end