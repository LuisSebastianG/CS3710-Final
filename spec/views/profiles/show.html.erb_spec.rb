require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @user = User.create!(username: "username1", email: "test@msudenver.edu", password: "password")
    @profile = assign(:profile, Profile.create!(bio: "My bio", user: @user))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match /My bio/
  end
end