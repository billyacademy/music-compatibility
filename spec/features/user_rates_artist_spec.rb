require 'rails_helper'

feature 'user rates an artist', %Q{
  As a user
  I want rate an artist
  So that I can compare my tastes with other users
} do

    scenario 'rate an artist' do
      @user = FactoryGirl.create(:user)
      @artist1 = FactoryGirl.create(:artist)

      sign_in_as(@user)

      visit artists_path
      click_button "Love"

      expect(page).to have_content "You have declared your love for"

    end

  scenario 'rate four artists differently' do
    @user = FactoryGirl.create(:user)
    @artist1 = FactoryGirl.create(:artist)
    @artist2 = FactoryGirl.create(:artist)
    @artist3 = FactoryGirl.create(:artist)
    @artist4 = FactoryGirl.create(:artist)

    sign_in_as(@user)

    visit artists_path

    click_button "Love"
    expect(page).to have_content "You have declared your love for"
    click_button "Like"
    expect(page).to have_content "Ohh, I guess you like"
    click_button "Don't Know"
    expect(page).to have_content "It's okay, not everyone knows"
    click_button "Dislike"
    expect(page).to have_content "isn't for everyone, we won't tell!"
    expect(page).to have_content "You have rated every artist"
  end
end
