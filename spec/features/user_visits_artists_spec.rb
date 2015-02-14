require 'rails_helper'

feature 'user visits artists page', %Q{
  As a user
  I want view a list of artists
  So that I can rate them based on my taste
  } do
    scenario 'rate an artist' do
      user = FactoryGirl.create(:user)

      sign_in_as(user)

      visit artists_path

      expect(page).to have_content "Rate an Artist!"
    end
  end
