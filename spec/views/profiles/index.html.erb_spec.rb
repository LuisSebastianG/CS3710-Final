require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        bio: "MyText"
      ),
      Profile.create!(
        bio: "MyText"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
