require 'rails_helper'

RSpec.describe "scrolls/index", type: :view do
  before(:each) do
    assign(:scrolls, [
      Scroll.create!(body: "First feed item", user: User.create!(username: "username1", email: "test1@msudenver.edu", password: "password")),
      Scroll.create!(body: "Second feed item", user: User.create!(username: "username2", email: "test2@msudenver.edu", password: "password"))
    ])
  end

  it "renders a list of scrolls" do
    render
    expect(rendered).to match /First feed item/
    expect(rendered).to match /Second feed item/
  end
end