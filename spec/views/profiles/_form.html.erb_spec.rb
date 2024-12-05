require 'rails_helper'

RSpec.describe "profiles/_form", type: :view do
  before(:each) do
    @user = User.create!(username: "username1", email: "test@msudenver.edu", password: "password")
    @profile = Profile.new
  end

  it "renders the form" do
    render partial: "profiles/form", locals: { profile: @profile, user: @user }
    expect(rendered).to have_selector("form[action='#{user_profiles_path(user_id: @user.id)}']")
  end
end