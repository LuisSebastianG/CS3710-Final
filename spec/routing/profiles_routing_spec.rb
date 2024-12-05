require 'rails_helper'

RSpec.describe ProfilesController, type: :routing do
  let(:user_id) { "1" }
  let(:profile_id) { "1" }

  it "routes to #index" do
    expect(get: "/users/#{user_id}/profiles").to route_to("profiles#index", user_id: user_id)
  end

  it "routes to #new" do
    expect(get: "/users/#{user_id}/profiles/new").to route_to("profiles#new", user_id: user_id)
  end

  it "routes to #show" do
    expect(get: "/users/#{user_id}/profiles/#{profile_id}").to route_to("profiles#show", user_id: user_id, id: profile_id)
  end

  it "routes to #edit" do
    expect(get: "/users/#{user_id}/profiles/#{profile_id}/edit").to route_to("profiles#edit", user_id: user_id, id: profile_id)
  end

  it "routes to #create" do
    expect(post: "/users/#{user_id}/profiles").to route_to("profiles#create", user_id: user_id)
  end

  it "routes to #update via PUT" do
    expect(put: "/users/#{user_id}/profiles/#{profile_id}").to route_to("profiles#update", user_id: user_id, id: profile_id)
  end

  it "routes to #update via PATCH" do
    expect(patch: "/users/#{user_id}/profiles/#{profile_id}").to route_to("profiles#update", user_id: user_id, id: profile_id)
  end

  it "routes to #destroy" do
    expect(delete: "/users/#{user_id}/profiles/#{profile_id}").to route_to("profiles#destroy", user_id: user_id, id: profile_id)
  end
end