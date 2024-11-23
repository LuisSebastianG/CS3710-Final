FactoryBot.define do
    factory(:user) do
        username { "checkingFaker"}
        email { "user1@msudenver.edu" }
        password { "password" }
        password_confirmation { "password" }
    end
end