require 'rails_helper'

feature 'user visits users page', %Q{
  As a user
  I want to visit the users page
  So that I can compare my tastes with other users
  } do
    scenario 'visit users page' do
      user = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      artist = FactoryGirl.create(:artist)

      sign_in_as(user)

      visit users_path


      expect(page).to have_content user2.email
    end
  end
