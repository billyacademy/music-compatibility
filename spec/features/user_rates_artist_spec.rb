require 'rails_helper'

feature 'user rates an artist', %Q{
  As a user
  I want rate an artist
  So that I can compare my tastes with other users
  } do
    scenario 'rate an artist' do
      user = FactoryGirl.create(:user)
      artist = FactoryGirl.create(:artist)
      sign_in_as(user)

      visit artists_path
      click_button "Love"

      expect(page).to have_content "You have successfully rated an artist!"
    end
  end
