require 'rails_helper'

describe User do
  context "When testing user's view" do
    it do
      visit '/users/new'

      within("#new_user") do
        fill_in 'Name', :with => "Junior"
        fill_in 'Email', :with => "junior@hotmail.com"

        fill_in 'user_locals_attributes_0_address', :with => "Rua Mayza Matarazzo"
      end

      click_button 'Create User'
      expect(page).to have_content 'User was successfully created'
    end
  end
